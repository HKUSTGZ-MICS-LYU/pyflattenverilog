from antlr4_verilog import InputStream, CommonTokenStream, ParseTreeWalker
from antlr4_verilog.verilog import VerilogLexer, VerilogParser, VerilogParserListener

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

# 1. Specify the top module
top_module = 'adder_32bit'
# 2. Start tree traversal from the top module

# 3. Walk to the first node with initialization

# 4. Get the name of the instance and rename all variable

# 5. Print the content of the renamed instance and print it to the pos of initialization 


class ModuleIdentifierListener(VerilogParserListener):
    def exitModule_declaration(self, ctx):
        self.identifier = ctx.module_identifier().getText() 


lexer = VerilogLexer(InputStream(design))
stream = CommonTokenStream(lexer)
parser = VerilogParser(stream)

tree = parser.source_text()

# Naive Walker: Print the module identifier through tree structure:"adder_8bit"
print(tree.getChild(0).getChild(0).getChild(1).getText())

# Identifier Walker: Print the exit module identifier through context
listener = ModuleIdentifierListener()
walker = ParseTreeWalker()
walker.walk(listener, tree)
print(listener.identifier) 
