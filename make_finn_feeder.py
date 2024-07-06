import templates
import os
import sys
import argparse
import util 
from pathlib import Path

def main() -> int:
    parser = argparse.ArgumentParser(description='Gera um IP Feeder, um controlador específico para um acelerador gerado com o FINN.')
    project_name = "teste"
    parser.add_argument('-p', '--project', type=str, help='Nome do projeto Vivado', default=project_name)
    board_fpga_part = "xc7z020clg400-1" # igual o nome da pasta dentro dos IPs
    parser.add_argument('-fp', '--fpga_part', type=str, help='FPGA part da placa', default=board_fpga_part)
    finn_name = "t2w8_5000fps" # igual o nome da pasta dentro dos IPs
    parser.add_argument('-f', '--finn', type=str, help='Nome do IP do FINN', default=finn_name)
    config_json = "config.json" # igual o nome da pasta dentro dos IPs
    parser.add_argument('-j', '--json', type=str, help='Caminho para o JSON de configuração', default=config_json)
    feeder_name = "finn_feeder_chiplet"
    parser.add_argument('-fd','--feeder', type=str, help='Nome do feeder', default=feeder_name)

    isWindows = sys.platform.startswith('win') or sys.platform.startswith('cygwin')
    if isWindows:
        proj_base_path = Path("C:/Users/Usuario/Desktop/Bolsa/teste") # com a barra assim mesmo -> / 
    else:
        proj_base_path = Path("/home/artti/Desktop/finn_sources/projeto_teste")
    parser.add_argument('-path', type=Path, help='Caminho do projeto Vivado', default=proj_base_path)

    parsed_args = parser.parse_args()
    proj_base_path = Path(parsed_args.path)
    project_name = parsed_args.project
    finn_name = parsed_args.finn
    board_fpga_part = parsed_args.fpga_part
    config_json = parsed_args.json
    feeder_name = parsed_args.feeder
    
    print(parsed_args)

    script_dir = Path(os.getcwd()).absolute().as_posix()
    json = util.read_json_file("./feeder_config.json")

    # Escreve o script TCL em um arquivo
    with open(f"/home/artti/Desktop/finn_sources/hls_teste/feeder/finn_feeder_chiplet/finn_feeder_chiplet.cpp", "w") as file:
        file.write(templates.generate_feeder_main(
            cfg_json=json, 
            finn_name=finn_name, 
            script_dir=script_dir)
        )
        print("ainnnn")
    
    # Escreve o script TCL em um arquivo
    with open(f"/home/artti/Desktop/finn_sources/hls_teste/feeder/finn_feeder_chiplet/finn_feeder_chiplet.h", "w") as file:
        file.write(templates.generate_feeder_main_header(
            cfg_json=json, 
            finn_name=finn_name, 
            script_dir=script_dir)
        )
        print("ainnnn")

    
    # if (proj_base_path.exists() and (proj_base_path / f"{project_name}.xpr").exists()):

    #     sv_file = ""

    #     # Escreve o script TCL em um arquivo
    #     with open(f"compatible_{bd_name}.sv", "w") as file:
    #         file.write(templates.generate_compatible_finn_sv(bd_name))
    #         sv_file = f"{script_dir}/{file.name}"
    #         print("Wrapper do FINN Chiplet gerado com sucesso!")

    #     # Escreve o script TCL em um arquivo
    #     with open("script.tcl", "w") as file:
    #         file.write(templates.generate_tcl_script(
    #             proj_base_path=proj_base_path.absolute().as_posix(),
    #             project_name=project_name,
    #             script_dir=script_dir,
    #             bd_name=bd_name,
    #             sv_file=sv_file,
    #             finn_name=finn_name,
    #             feeder_name=feeder_name,
    #             board_fpga_part=board_fpga_part,
    #             isWindows=isWindows,
    #             id_width=2,
    #             user_width=2,
    #             verilog_define="USE_FINN"
    #         ))
    #         print("Script TCL gerado com sucesso!")

    #     # if isWindows:
    #     #     print("Abra o script no Vivado")
    #     #     print(f"Tools > Run Tcl Script... > {script_dir}/script.tcl")
    #     # else:
    #         # Executa o comando Vivado no terminal
    #     print("Executando Vivado...")
    #     cmd = f"vivado -mode batch -source ./script.tcl"
    #     process = util.execute_cmd(cmd)

    #     # Verifica o resultado
    #     if process.returncode == 0:
    #         print("\nScript TCL executado com sucesso!")
    #     else:
    #         print("\nErro ao executar o script TCL no Vivado.")
    #         print("Saída de erro:")
    #         print(process)
    #     return process.returncode
    # else: 
    #     print("Algum dos caminhos está errado")            
    #     print(proj_base_path) 
    #     print(proj_base_path/f"{project_name}.xpr")        
    #     return 1 

if __name__ == "__main__":
    sys.exit(main())