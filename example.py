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

class ModuleIdentifierListener(VerilogParserListener):
    def exitModule_declaration(self, ctx):
        self.identifier = ctx.module_identifier().getText() 

class MyTestModuleVisitor(VerilogParserVisitor):
  def visitModule_declaration(self, ctx):
    module_name = ctx.module_identifier().getText()



lexer = VerilogLexer(InputStream(design))
stream = CommonTokenStream(lexer)
parser = VerilogParser(stream)

tree = parser.source_text()


# 1. Naive Walker: Print the module identifier through tree structure:"adder_8bit"
# print(tree.getChild(0).getChild(0).getChild(1).getText())

# 2. Identifier Walker: Print the exit module identifier through context:"adder_32bit"
listener = ModuleIdentifierListener()
walker = ParseTreeWalker()
walker.walk(listener, tree)
print(listener.identifier) 

#3. Visitor Walker: Print all the module name: "adder_8bit", "adder_16bit", "adder_32bit"
visitor = MyTestModuleVisitor()
visitor.visit(tree)
