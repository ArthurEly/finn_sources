import subprocess
import sys
import time
import templates_win
import os

# MUDE ESSES PARÂMETROS
script_dir = os.getcwd()
script_dir = script_dir.replace("\\","/")
proj_base_path = r"C:/Users/Usuario/Desktop/Bolsa/teste" # com a barra assim mesmo -> /
project_name = "teste"
bd_name = "finn_chiplet_win"
finn_name = "t2w8_5000fps"
feeder_name = "feeder_21b"

sv_file = ""

# Escreve o script TCL em um arquivo
with open(f"compatible_{bd_name}.sv", "w") as file:
    file.write(templates_win.generate_compatible_finn_sv(bd_name))
    sv_file = f"{script_dir}/{file.name}"
    print("Wrapper do FINN Chiplet gerado com sucesso!")

# Escreve o script TCL em um arquivo
with open("script_win.tcl", "w") as file:
    file.write(templates_win.generate_tcl_script(
        proj_base_path=proj_base_path,
        project_name=project_name,
        script_dir=script_dir,
        bd_name=bd_name,
        sv_file=sv_file,
        finn_name=finn_name,
        feeder_name=feeder_name
    ))
    print("Script TCL gerado com sucesso!")

print("No Vivado: Tools > Run TCL Script > script_win.tcl")