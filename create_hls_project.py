import templates
import os
import sys
import argparse
import subprocess
from pathlib import Path

def execute_cmd(cmd):
    result = subprocess.run(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    return result

def main() -> int:
    parser = argparse.ArgumentParser(description='Importa o FINN Chiplet para um projeto Vivado.')
    
    project_name = "teste_hls"
    parser.add_argument('-p', '--project', type=str, help='Nome do projeto Vitis', default=project_name)

    fpga_part = "xc7z020clg400-1"
    parser.add_argument('-fp', '--fpga_part', type=str, help='Nome da placa FPGA', default=fpga_part)
    
    feeder_name = "finn_feeder_chiplet"
    parser.add_argument('-f', '--feeder_name', type=str, help='Nome do feeder', default=feeder_name)
    
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
        output_path=f"{script_dir}/test_IPs"
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
    else:
        print("\nErro ao executar o script TCL no Vitis HLS.")
        print("Saída de erro:")
        print(process.stderr)
    return process.returncode

if __name__ == "__main__":
    sys.exit(main())
