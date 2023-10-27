import flatten
import preprocess
import os

# formatted part

path = '/home/xiangchenmeng/rtl/pyflat_copy/tests/regression/i2c/src'
inputfile = '/top.v'
outputfile = '/pre_top.v'
top_module = 'i2c_master_top' 
inputpath = path+inputfile
formatpath = path+outputfile

if os.path.exists(formatpath):
   os.remove(path=formatpath)
with open(path+inputfile, 'r') as f:
    design = f.read()
    preprocess.formatter_file(design, formatpath)

# flatten part


folder_path = os.path.dirname(formatpath)+'/tmp'

if os.path.exists(folder_path):
    file_list = os.listdir(folder_path)
    for filename in file_list:
        tmp_file_path = os.path.join(folder_path, filename)
        os.remove(tmp_file_path)
else:
    os.mkdir(folder_path)


tmp_output_path = os.path.dirname(formatpath)+'/tmp/'+formatpath.split('/')[-1]

debug_mode = True


with open(formatpath,"r") as file:
    design = file.read()
    tmp_flatten_design = flatten.pyflattenverilog(design, top_module, tmp_output_path, debug_mode)
    while True:
        if tmp_flatten_design != -1:
            tmp_flatten_design = flatten.pyflattenverilog(tmp_flatten_design, top_module, tmp_output_path, debug_mode)
        else:
            break


