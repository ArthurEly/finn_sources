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
    board_fpga_part = "xc7a100tcsg324-1" # igual o nome da pasta dentro dos IPs
    parser.add_argument('-fp', '--fpga_part', type=str, help='FPGA part da placa', default=board_fpga_part)
    finn_name = "t2w8_50000fps" # igual o nome da pasta dentro dos IPs
    parser.add_argument('-f', '--finn', type=str, help='Nome do IP do FINN', default=finn_name)
    config_json = "feeder_config.json" # igual o nome da pasta dentro dos IPs
    parser.add_argument('-j', '--json', type=str, help='Caminho para o JSON de configuração', default=config_json)
    feeder_name = "finn_feeder_21b_16"
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
    with open(f"{script_dir}/hls_sources/finn_feeder_chiplet.cpp", "w") as file:
        file.write(templates.generate_feeder_main(
            cfg_json=json, 
            finn_name=finn_name, 
            feeder_name=feeder_name,
            script_dir=script_dir)
        )
        print("ainnnn")
    
    # Escreve o script TCL em um arquivo
    with open(f"{script_dir}/hls_sources/finn_feeder_chiplet.h", "w") as file:
        file.write(templates.generate_feeder_main_header(
            cfg_json=json, 
            finn_name=finn_name, 
            feeder_name=feeder_name,
            script_dir=script_dir)
        )
        print("ainnnn")

if __name__ == "__main__":
    sys.exit(main())