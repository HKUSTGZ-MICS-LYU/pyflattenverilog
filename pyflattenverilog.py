import main
import os

file_path = 'tests/regression/b30/pre_b30.v'
top_module = 'b30' 
folder_path = os.path.dirname(file_path)+'/tmp'

if os.path.exists(folder_path):
    file_list = os.listdir(folder_path)
    for filename in file_list:
        tmp_file_path = os.path.join(folder_path, filename)
        os.remove(tmp_file_path)
else:
    os.mkdir(folder_path)


tmp_output_path = os.path.dirname(file_path)+'/tmp/'+file_path.split('/')[-1]

debug_mode = True


with open(file_path,"r") as file:
    design = file.read()
    tmp_flatten_design = main.pyflattenverilog(design, top_module, tmp_output_path, debug_mode)
    while True:
        if tmp_flatten_design != -1:
            tmp_flatten_design = main.pyflattenverilog(tmp_flatten_design, top_module, tmp_output_path, debug_mode)
        else:
            break


