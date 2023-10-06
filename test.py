from antlr4_verilog import InputStream, CommonTokenStream, ParseTreeWalker
from antlr4_verilog.verilog import VerilogLexer, VerilogParser, VerilogParserListener, VerilogParserVisitor
import antlr4

code = '''

assign b = a;

'''
lexer = VerilogLexer(InputStream(code))
stream = CommonTokenStream(lexer)
parser = VerilogParser(stream)
tree = parser.continuous_assign()

print(tree.toStringTree(recog=parser))
print(tree.getText())


# code = "wire adder_16bit_add_high_a;"

# # 以下是解析过程
# lexer = VerilogLexer(InputStream(code))
# stream = CommonTokenStream(lexer)
# parser = VerilogParser(stream)
# tree = parser.net_declaration()

# print(tree.toStringTree(recog=parser))
# print(tree.getText())


