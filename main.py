from antlr4_verilog import InputStream, CommonTokenStream, ParseTreeWalker
from antlr4_verilog.verilog import VerilogLexer, VerilogParser, VerilogParserListener, VerilogParserVisitor

design = '''
// 8 bit adder
module adder_8bit (
  input [7:0] a,
  input [7:0] b,
  output [7:0] sum
);

  assign sum = a + b;

endmodule

// 16 bit adder
module adder_16bit (
  input [15:0] a,
  input [15:0] b,
  output [15:0] sum  
);

  // high 8 bit adder
  adder_8bit add_high (
    .a(a[15:8]),
    .b(b[15:8]), 
    .sum(sum[15:8])
  );

  // low 8 bit adder
  adder_8bit add_low (
    .a(a[7:0]),
    .b(b[7:0]),
    .sum(sum[7:0]) 
  );

endmodule 

// 32 bit adder
module adder_32bit (
  input [31:0] a,
  input [31:0] b,
  output [31:0] sum
);

  // high 16 bit
  adder_16bit add_high (
    .a(a[31:16]),
    .b(b[31:16]),
    .sum(sum[31:16])
  );  

  // low 16 bit
  adder_16bit add_low (
    .a(a[15:0]),
    .b(b[15:0]), 
    .sum(sum[15:0])
  );

endmodule
'''

lexer = VerilogLexer(InputStream(design))
stream = CommonTokenStream(lexer)
parser = VerilogParser(stream)

tree = parser.source_text()

# 1. TODO: Specify the top module
top_module = 'adder_32bit'

# 2. TODO: Start tree traversal from the top module
class MyTopModuleVisitor(VerilogParserVisitor):
  def __init__(self):
      self.top_module_node = ""
  def visitModule_declaration(self, ctx:VerilogParser.Module_declarationContext):
      module_name = ctx.module_identifier().getText()
      if module_name == top_module:
        self.top_module_node = ctx

visitor = MyTopModuleVisitor()
visitor.visit(tree)
top_node_tree = visitor.top_module_node

# Print the design of top module
# print(design[top_node_tree.start.start:top_node_tree.stop.stop+1])

# 3. TODO: Walk to the first node with initialization
class MyModuleInstantiationVisitor(VerilogParserVisitor):
  def __init__(self):
    self.is_first_instantiation_module = False
    self.module_identifier = ""
    self.name_of_module_instance = ""
    self.list_of_ports_lhs = []
    self.list_of_ports_rhs = []

  def visitModule_instantiation(self, ctx: VerilogParser.Module_instantiationContext):
    if self.is_first_instantiation_module == False:
        self.is_first_instantiation_module = True
        self.first_instantiation = ctx
        self.module_identifier = ctx.module_identifier().getText()
        self.name_of_module_instance = ctx.module_instance()[0].name_of_module_instance().getText()
        # get ports connections
        ports_connections = ctx.module_instance()[0].list_of_port_connections()
        index = 0
        for child in ports_connections.getChildren():
          if index % 2 == 0:
            self.list_of_ports_lhs.append(child.port_identifier().getText())
            self.list_of_ports_rhs.append(child.expression().getText())
          index = index + 1
            
visitor = MyModuleInstantiationVisitor()
visitor.visit(top_node_tree)
cur_module_identifier = visitor.module_identifier
cur_name_of_module_instance = visitor.name_of_module_instance
cur_list_of_ports_lhs = visitor.list_of_ports_lhs
cur_list_of_ports_rhs = visitor.list_of_ports_rhs

# 4. TODO: Get the name of the instance and rename all variable

class InstModuleVisitor(VerilogParserVisitor):
  def __init__(self):
      self.inst_module_node = None

  def visitModule_declaration(self, ctx: VerilogParser.Module_declarationContext):
      cur_module_name = ctx.module_identifier().getText()
      if cur_module_name == cur_module_identifier:
          self.inst_module_node = ctx

class InstModuleVariableVisitor(VerilogParserVisitor):
  def __init__(self):
      self.inst_module_identifier = ""
      self.name_of_module_inst = ""
      self.list_of_ports_lhs = []
      self.list_of_ports_rhs = []
      self.input_ports = []
      self.output_ports = []

  def visitModule_instantiation(self, ctx: VerilogParser.Module_instantiationContext):
      self.inst_module_identifier = ctx.module_identifier().getText()
      self.name_of_module_inst = cur_name_of_module_instance
      # get ports connections
      ports_connections = ctx.module_instance()[0].list_of_port_connections()
      index = 0
      for child in ports_connections.getChildren():
        if index % 2 == 0:
          self.list_of_ports_lhs.append(child.port_identifier().getText())
          self.list_of_ports_rhs.append(child.expression().getText())
        index = index + 1
    
  def visitInput_declaration(self, ctx: VerilogParser.Input_declarationContext):
      port_name = ctx.list_of_port_identifiers().getText()
      self.input_ports.append(port_name)

  def visitOutput_declaration(self, ctx: VerilogParser.Output_declarationContext):
      port_name = ctx.list_of_port_identifiers().getText()
      self.output_ports.append(port_name)


visitor = InstModuleVisitor()
visitor.visit(tree)
inst_module_node = visitor.inst_module_node
visitor = InstModuleVariableVisitor()
visitor.visit(inst_module_node)
inst_module_identifier = visitor.inst_module_identifier
name_of_module_inst = visitor.name_of_module_inst
list_of_ports_lhs = visitor.list_of_ports_lhs
list_of_ports_rhs = visitor.list_of_ports_rhs


print("inst_module_identifier:", inst_module_identifier)
print("name_of_module_inst:", name_of_module_inst)
print("list_of_ports_lhs:", list_of_ports_lhs)
print("list_of_ports_rhs:", list_of_ports_rhs)
print(visitor.input_ports)
print(visitor.output_ports)

# 5. TODO: define the register and wire for port


# 6. TODO: Print the content of the renamed instance and print it to the pos of initialization 

# Debug: Check visiting rules
# class DebugVisitor(VerilogParserVisitor):
#     def visitChildren(self, node):
#         rule_name = VerilogParser.ruleNames[node.getRuleIndex()]
#         print("Visiting rule:", rule_name)
#         return super().visitChildren(node)

# debug_visitor = DebugVisitor()
# debug_visitor.visit(tree)