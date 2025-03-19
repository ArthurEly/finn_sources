import templates
import os
import sys
import argparse
import subprocess
from pathlib import Path
import util 
import zipfile

def execute_cmd(cmd):
    result = subprocess.run(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    return result

def main() -> int:
    parser = argparse.ArgumentParser(description='Importa o FINN Chiplet para um projeto Vivado.')
    
    project_name = "teste_hls"
    parser.add_argument('-p', '--project', type=str, help='Nome do projeto Vitis', default=project_name)

    fpga_part = "xc7a100tcsg324-1"
    parser.add_argument('-fp', '--fpga_part', type=str, help='Nome da placa FPGA', default=fpga_part)
    
    finn_name = "t2w8_50000fps" # igual o nome da pasta dentro dos IPs
    parser.add_argument('-f', '--finn', type=str, help='Nome do IP do FINN', default=finn_name)

    feeder_name = "finn_feeder_21b_16"
    parser.add_argument('-fd', '--feeder_name', type=str, help='Nome do feeder', default=feeder_name)
    
    config_json = "feeder_config.json" # igual o nome da pasta dentro dos IPs    
    parser.add_argument('-j', '--json', type=str, help='Caminho para o JSON de configuração', default=config_json)

    clock_period = 10
    parser.add_argument('-cp', '--clock_period', type=int, help='Período do clock (ns)', default=clock_period)
    
    clock_uncertainty = 0.5
    parser.add_argument('-cun', '--clock_uncertainty', type=int, help='Incerteza do clock (ns)', default=clock_uncertainty)

    parsed_args = parser.parse_args()
    project_name = parsed_args.project
    fpga_part = parsed_args.fpga_part
    feeder_name = parsed_args.feeder_name
    clock_period = parsed_args.clock_period
    clock_uncertainty = parsed_args.clock_uncertainty

    script_dir = Path(os.getcwd()).absolute().as_posix()
    json = util.read_json_file("./feeder_config.json")

    # Escreve as funções main do HLS 
    #TODO:
        #criar main.cpp
        #criar teste.cpp
    with open(f"{script_dir}/hls_sources/{feeder_name}.cpp", "w") as file:
        file.write(templates.generate_feeder_main(
            cfg_json=json, 
            finn_name=finn_name, 
            feeder_name=feeder_name,
            script_dir=script_dir)
        )

    with open(f"{script_dir}/hls_sources/{feeder_name}.h", "w") as file:
        file.write(templates.generate_feeder_main_header(
            cfg_json=json, 
            finn_name=finn_name, 
            feeder_name=feeder_name,
            script_dir=script_dir)
        )

    util.create_dir(f"{script_dir}/test_IPs/")

    # Escreve o script TCL em um arquivo
    tcl_script = templates.generate_hls_project_script(
        project_name=f"{project_name}",
        header_file=f"{script_dir}/hls_sources/{feeder_name}.h",
        feeder_file=f"{script_dir}/hls_sources/{feeder_name}.cpp",
        feeder_name=feeder_name,
        testbench_file=f"{script_dir}/hls_sources/{feeder_name}_test.cpp",
        fpga_part=fpga_part,
        clock_period=clock_period,
        clock_uncertainty=clock_uncertainty,
        output_path=f"{script_dir}/test_IPs/"
    )

    with open("hls_project_script.tcl", "w") as file:
        file.write(tcl_script)
        tcl_file = f"{script_dir}/{file.name}"
        print("Script TCL do projeto HLS gerado com sucesso!")

    # Executa o comando Vivado no terminal
    print("Executando script no Vitis HLS...")
    cmd = f"vitis_hls -f {tcl_file}"
    process = execute_cmd(cmd)

    # Verifica o resultado
    if process.returncode == 0:
        print("\nScript TCL executado com sucesso!")
        with zipfile.ZipFile(f'{script_dir}/test_IPs/export.zip', 'r') as zip:
            # Extraia todos os arquivos do arquivo ZIP para um diretório específico
            zip.extractall(f'{script_dir}/test_IPs/{fpga_part.replace("-","_")}/{feeder_name}/')
    else:
        print("\nErro ao executar o script TCL no Vitis HLS.")
        print("Saída de erro:")
        print(process.stderr)
    return process.returncode

if __name__ == "__main__":
    sys.exit(main())
