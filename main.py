from antlr4_verilog import InputStream, CommonTokenStream, ParseTreeWalker
from antlr4_verilog.verilog import VerilogLexer, VerilogParser, VerilogParserListener, VerilogParserVisitor
import antlr4
from io import StringIO

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

"This function is used to convert the verilog to a tree"
def Design2Tree(Design):
    lexer = VerilogLexer(InputStream(Design))
    stream = CommonTokenStream(lexer)
    parser = VerilogParser(stream)
    tree = parser.source_text()
    return tree

def Wire2Tree(Wire):
    lexer = VerilogLexer(InputStream(Wire))
    stream = CommonTokenStream(lexer)
    parser = VerilogParser(stream)
    tree = parser.net_declaration()
    return tree

def Assign2Tree(Assign):
    lexer = VerilogLexer(InputStream(Assign))
    stream = CommonTokenStream(lexer)
    parser = VerilogParser(stream)
    tree = parser.continuous_assign()
    return tree

# 1. TODO: Specify the top module and convert the design to a tree
tree = Design2Tree(design)
top_module = 'adder_32bit'

# 2. TODO: Get the top module node
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
    self.list_of_ports_rhs_width = []

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
            self.list_of_ports_rhs.append(child.expression().getText())
            self.list_of_ports_lhs.append(child.port_identifier().getText())
          index = index + 1
            
visitor = MyModuleInstantiationVisitor()
visitor.visit(top_node_tree)
cur_module_identifier = visitor.module_identifier
cur_name_of_module_instance = visitor.name_of_module_instance
cur_prefix = cur_name_of_module_instance
cur_list_of_ports_lhs = visitor.list_of_ports_lhs
cur_list_of_ports_rhs = visitor.list_of_ports_rhs


class InstModulePortVisitor(VerilogParserVisitor):
  def __init__(self):
      self.inst_module_node = None
      self.list_of_ports_width = []
      self.list_of_ports_direction = []


  def _traverse_children(self,ctx):  
      if isinstance(ctx, antlr4.tree.Tree.TerminalNodeImpl):
        pass
      else:
        for child in ctx.getChildren():
          if isinstance(child, VerilogParser.Range_Context):
            self.list_of_ports_width.append(child.getText())
          if isinstance(child, VerilogParser.Input_declarationContext):
            self.list_of_ports_direction.append('input')
          if isinstance(child, VerilogParser.Output_declarationContext):
            self.list_of_ports_direction.append('output')
          self._traverse_children(child)

  def visitModule_declaration(self, ctx: VerilogParser.Module_declarationContext):
      module_name = ctx.module_identifier().getText()
      if module_name == cur_module_identifier:
        self.inst_module_node = ctx
        self._traverse_children(self.inst_module_node)

visitor = InstModulePortVisitor()
visitor.visit(tree)
cur_list_of_ports_lhs_width = visitor.list_of_ports_width
cur_list_of_ports_direction = visitor.list_of_ports_direction


# 4. Obtain new assignment with 'prefix', lhs and rhs and define the port as wire type
# Implementation: define the lhs variable with new name in "assign field" and connect with rhs variable
# e.g. variable 'a' in 'add_high in 'adder_32bit', It should be adder_32bit_add_high_a, first define it as wire type
# i.g. 'wire adder_32bit_add_high_a;' 
# i.e.`assign adder_32bit_add_high_a = a[31:16]` 
cur_new_wire = []
cur_new_assign = []
for i in range(0,len(cur_list_of_ports_lhs)):
  cur_new_wire.append('wire ' + cur_list_of_ports_lhs_width[i] + ' '+cur_prefix + '_' + cur_list_of_ports_lhs[i] + ';')
  if cur_list_of_ports_direction[i] == 'input': 
    cur_new_assign.append('assign ' + cur_prefix + '_' + cur_list_of_ports_lhs[i] + ' = '+ cur_list_of_ports_rhs[i] + ';')
  else:
    cur_new_assign.append('assign ' + cur_list_of_ports_rhs[i] + ' = '+ cur_prefix + '_' + cur_list_of_ports_lhs[i] + ';')


# 5. TODO: Rename all variable
def getTokenText(ctx: VerilogParser.Module_declarationContext):
  text = ""
  if ctx.getChildCount() == 0:
    return ""
  with StringIO() as builder:
    for child in ctx.getChildren():
          builder.write(child.getText()+' ')
    temp = builder.getvalue()
    for line in temp.splitlines():
        for char in line: 
          if char == ',' or char == ';':
            text += char + '\n'
          else:
            text += char
    return text

# replace the corresponding variables with `cur_prefix`
class InstModuleVisitor(VerilogParserVisitor):
  def __init__(self):
      super().__init__()
      self.inst_module_node = None
      self.inst_module_design = None
      self.start = None
      self.stop = None

  "This function is used to traverse the tree and change the name of the instance"
  def _traverse_children(self,ctx):  
    if isinstance(ctx, antlr4.tree.Tree.TerminalNodeImpl):
      pass
    else:
      for child in ctx.getChildren():
        if isinstance(child, VerilogParser.Module_instantiationContext):
            child.start.text = child.start.text + ' '
        if isinstance(child, VerilogParser.Name_of_module_instanceContext):
            child.start.text = cur_prefix + '_' + child.start.text
        if isinstance(child, VerilogParser.ExpressionContext) and isinstance(child.parentCtx, VerilogParser.ExpressionContext):
            child.start.text = ' ' + cur_prefix + '_' + child.start.text + ' '
        if isinstance(child, VerilogParser.ExpressionContext) and isinstance(child.parentCtx, VerilogParser.Named_port_connectionContext):
            child.start.text = ' ' + cur_prefix + '_' + child.start.text + ' '    
        if isinstance(child, VerilogParser.Net_lvalueContext):
            child.start.text = ' ' + cur_prefix + '_' + child.start.text + ' '
        self._traverse_children(child)


  def visitModule_declaration(self, ctx: VerilogParser.Module_declarationContext):
      module_name = ctx.module_identifier().getText()
      if module_name == cur_module_identifier:
        self.inst_module_node = ctx        
        self._traverse_children(self.inst_module_node)
        self.inst_module_design = getTokenText(self.inst_module_node)
        self.inst_module_node = Design2Tree(self.inst_module_design)

visitor = InstModuleVisitor()
visitor.visit(tree)
inst_module_node = visitor.inst_module_node
inst_module_design = visitor.inst_module_design

# 6. TODO: Get the instance body
class InstBodyVisitor(VerilogParserVisitor):
  def __init__(self):
    super().__init__()
    self.start = None
    self.stop = None

  def _traverse_children(self,ctx):
    if isinstance(ctx, VerilogParser.Module_declarationContext):
       self.stop = ctx.stop.start-1
    if isinstance(ctx, antlr4.tree.Tree.TerminalNodeImpl): 
       pass
    else:
       for child in ctx.getChildren():
         if isinstance(child, VerilogParser.List_of_port_declarationsContext):
            self.start = child.stop.stop+3
         self._traverse_children(child) 
  
  def visitModule_declaration(self, ctx: VerilogParser.Module_declarationContext):
      self._traverse_children(ctx)

visitor = InstBodyVisitor()
visitor.visit(inst_module_node)
inst_body_start = visitor.start
inst_body_stop = visitor.stop
insert_part = inst_module_design[inst_body_start:inst_body_stop+1]


# 7. Replace the instance with new assignment and add instance body in the top module
class VerilogIdentifierVisitor(VerilogParserVisitor):
    def __init__(self):
        super().__init__()

    def visitModule_declaration(self, ctx: VerilogParser.Module_declarationContext):
        cur_start = None
        cur_stop = None
        if ctx.module_identifier().getText() == top_module:
            for child in ctx.getChildren():
                if isinstance(child, VerilogParser.Non_port_module_itemContext) and isinstance(child.getChild(0).getChild(0), VerilogParser.Module_instantiationContext):
                    inst_name = child.getChild(0).getChild(0).getChild(1).getChild(0).getText()
                    if inst_name == cur_name_of_module_instance:
                        cur_start = child.start.start
                        cur_stop = child.stop.stop
                        print(design[:cur_start])
                        for wire in cur_new_wire:
                            print(wire)
                        for assign in cur_new_assign:
                            print(assign)
                        print(insert_part)
                        print(design[cur_stop+1:])
            
            
# Create a visitor instance and visit the top module node
visitor = VerilogIdentifierVisitor()
visitor.visit(top_node_tree)                          