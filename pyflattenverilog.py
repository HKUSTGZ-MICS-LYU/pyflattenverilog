import main
import os

folder_path = "tests/regression/b19/flatten"


file_list = os.listdir(folder_path)
for filename in file_list:
    file_path = os.path.join(folder_path, filename)
    os.remove(file_path)


file_path = 'tests/regression/b19/unflatten/b19.v'
output_path = 'tests/regression/b19/flatten/f_b19.v'
top_module = 'b19'



with open(file_path,"r") as file:
    design = file.read()
    tmp_flatten_design = main.pyflattenverilog(design, top_module, output_path)
    while True:
        if tmp_flatten_design != -1:
            tmp_flatten_design = main.pyflattenverilog(tmp_flatten_design, top_module, output_path)
        else:
            break


