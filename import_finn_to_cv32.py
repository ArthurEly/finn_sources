import subprocess
import sys
import time
import templates
import os

# MUDE ESSES PARÂMETROS
script_dir = os.getcwd()
proj_base_path = "/home/artti/Desktop/chi2p/dependencies2/implementation/vivado_results/cv32e40p_project"
project_name = "cv32e40p_project"
bd_name = "finn_chiplet_b"
finn_name = "t2w8_5000fps"
feeder_name = "feeder_21b"

sv_file = ""

# Escreve o script TCL em um arquivo
with open(f"compatible_{bd_name}.sv", "w") as file:
    file.write(templates.generate_compatible_finn_sv(bd_name))
    sv_file = f"{script_dir}/{file.name}"
    print("Wrapper do FINN Chiplet gerado com sucesso!")

# Escreve o script TCL em um arquivo
with open("script.tcl", "w") as file:
    file.write(templates.generate_tcl_script(
        proj_base_path=proj_base_path,
        project_name=project_name,
        script_dir=script_dir,
        bd_name=bd_name,
        sv_file=sv_file,
        finn_name=finn_name,
        feeder_name=feeder_name
    ))
    print("Script TCL gerado com sucesso!")

# Executa o comando Vivado no terminal
print("Executando Vivado...")
cmd = f"vivado -mode batch -source ./script.tcl"
process = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

# Indicador de progresso
while process.poll() is None:
    sys.stdout.write(".")
    sys.stdout.flush()
    time.sleep(1)

# Verifica o resultado
if process.returncode == 0:
    print("\nScript TCL executado com sucesso!")
else:
    print("\nErro ao executar o script TCL no Vivado.")
    print("Saída de erro:")
    print(process.stderr.read().decode('utf-8'))