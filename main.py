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
print(design[top_node_tree.start.start:top_node_tree.stop.stop+1])

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
cur_prefix = cur_module_identifier + '_' + cur_name_of_module_instance
cur_list_of_ports_lhs = visitor.list_of_ports_lhs
cur_list_of_ports_rhs = visitor.list_of_ports_rhs


# 4. Obtain new assignment with 'prefix', lhs and rhs and define the port as wire type
# Implementation: define the lhs variable with new name in "assign field" and connect with rhs variable
# e.g. variable 'a' in 'add_high in 'adder_32bit', It should be adder_32bit_add_high_a, first define it as wire type
# i.g. 'wire adder_32bit_add_high_a;' 
cur_new_wire = ['wire ' + cur_prefix + '_' + cur_list_of_ports_lhs[i] + ';'
                for i in range(0,len(cur_list_of_ports_lhs))]
# i.e. We should have `assign adder_32bit_add_high_a = a[31:16]` on the top
cur_new_assign = ['assign ' + cur_prefix + '_' + cur_list_of_ports_lhs[i] + ' = '+ cur_list_of_ports_rhs[i] + ';' 
                  for i in range(0,len(cur_list_of_ports_rhs))]
# print(cur_new_wire)
# print(cur_new_assign)

# 5. On how to rename all variables with new instance name
# Step 1: Write a visitor that can visit  any token
# print(design[top_node_tree.start.start:top_node_tree.stop.stop+1])
class VerilogIdentifierVisitor(VerilogParserVisitor):
    def __init__(self):
        super().__init__()

    def visitModule_declaration(self, ctx: VerilogParser.Module_declarationContext):
      print(ctx.module_identifier().getText())
      if ctx.module_identifier().getText() == top_module:
          for child in ctx.getChildren():
              if isinstance(child, VerilogParser.Non_port_module_itemContext):
                  print(f"Instantiated module: {child.getText()}")

visitor = VerilogIdentifierVisitor()
visitor.visit(tree)

# Step 2: Print every token with `print(design[left:right])` (refer to line 86)
# Step 2.1: If we get `assign`token, print cur_new_assign with correct indent

# Step 3: If the token meets `cur_name_of_module_instance` in `top`
# Step 3.1. Get tree root of cur_module_identifier

# Step 4. Write a visitor that can visit every token from tree root of cur_module_identifier
# Step 4.1. If the token is simple_identifier, simply replace it with `cur_prefix`


# 6. TODO: Get the name of the instance and rename all variable

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


# 7. TODO: Print the content of the renamed instance and print it to the pos of initialization 

# Debug: Check visiting rules
# class DebugVisitor(VerilogParserVisitor):
#     def visitChildren(self, node):
#         rule_name = VerilogParser.ruleNames[node.getRuleIndex()]
#         print("Visiting rule:", rule_name)
#         return super().visitChildren(node)

# debug_visitor = DebugVisitor()
# debug_visitor.visit(tree)