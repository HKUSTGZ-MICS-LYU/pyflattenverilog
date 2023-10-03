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

# 1. Specify the top module
top_module = 'adder_32bit'

# 2. Start tree traversal from the top module
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

# 3. Walk to the first node with initialization
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


# 4. Get the name of the instance and rename all variable

# 5. Print the content of the renamed instance and print it to the pos of initialization 

