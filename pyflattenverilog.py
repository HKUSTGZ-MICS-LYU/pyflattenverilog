import main

file_path = 'tests/regression/adder/unflatten/adder.v'
output_path = 'tests/regression/adder/flatten/f_adder.v'
top_module = 'adder_32bit'

with open(file_path,"r") as file:
    design = file.read()
    tmp_flatten_design = main.pyflattenverilog(design, top_module, output_path)
    while True:
        if tmp_flatten_design != -1:
            tmp_flatten_design = main.pyflattenverilog(tmp_flatten_design, top_module, output_path)
        else:
            break





