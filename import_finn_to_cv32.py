import templates
import os
import util 

# MUDE ESSES PARÂMETROS
script_dir = os.getcwd()
isWindows = False
script_dir = script_dir.replace("\\","/") # for Windows

project_name = "projeto_teste"
bd_name = "finn_chiplet"
finn_name = "t2w8_5000fps"
fpga_board_name = "Nexys4"
feeder_name = "feeder_21b"

if isWindows:
    proj_base_path = r"C:/Users/Usuario/Desktop/Bolsa/teste" # com a barra assim mesmo -> / 
else:
    proj_base_path = "/home/artti/Desktop/finn_sources/projeto_teste"

if (util.check_path(proj_base_path)):

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
            feeder_name=feeder_name,
            fpga_board_name=fpga_board_name,
            isWindows=isWindows,
            id_width=2,
            user_width=2
        ))
        print("Script TCL gerado com sucesso!")

    if isWindows:
        print("Abra o script no Vivado")
        print(f"Tools > Run Tcl Script... > {script_dir}/script.tcl")
    else:
        # Executa o comando Vivado no terminal
        print("Executando Vivado...")
        cmd = f"vivado -mode batch -source ./script.tcl"
        process = util.execute_cmd(cmd)

        # Verifica o resultado
        if process.returncode == 0:
            print("\nScript TCL executado com sucesso!")
        else:
            util.print_error(process)
