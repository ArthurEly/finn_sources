import templates
import os
import sys
import argparse
import util 
from pathlib import Path

def main() -> int:
    parser = argparse.ArgumentParser(description='Importa o FINN Chiplet para um projeto Vivado.')
    project_name = "teste"
    parser.add_argument('-p', '--project', type=str, help='Nome do projeto Vivado', default=project_name)
    bd_name = "finn_chiplet"
    parser.add_argument('-bd', type=str, help='Nome do bloco de design', default=bd_name)
    finn_name = "t2w8_5000fps" # igual o nome da pasta dentro dos IPs
    parser.add_argument('-f', '--finn', type=str, help='Nome do IP do FINN', default=finn_name)
    fpga_board_name = "PYNQ_Z2" # igual o nome da pasta dentro dos IPs
    parser.add_argument('-b', '--board', type=str, help='Nome da placa FPGA', default=fpga_board_name)
    feeder_name = "feeder_21b"
    parser.add_argument('-feeder', type=str, help='Nome do feeder', default=feeder_name)

    isWindows = sys.platform.startswith('win') or sys.platform.startswith('cygwin')
    if isWindows:
        proj_base_path = Path("C:/Users/Usuario/Desktop/Bolsa/teste") # com a barra assim mesmo -> / 
    else:
        proj_base_path = Path("/home/artti/Desktop/finn_sources/projeto_teste")
    parser.add_argument('-path', type=Path, help='Caminho do projeto Vivado', default=proj_base_path)

    parsed_args = parser.parse_args()
    proj_base_path = Path(parsed_args.path)
    project_name = parsed_args.project
    bd_name = parsed_args.bd
    finn_name = parsed_args.finn
    fpga_board_name = parsed_args.board
    feeder_name = parsed_args.feeder
    
    script_dir = Path(os.getcwd()).absolute().as_posix()
    
    if (proj_base_path.exists() and (proj_base_path / f"{project_name}.xpr").exists()):

        sv_file = ""

        # Escreve o script TCL em um arquivo
        with open(f"compatible_{bd_name}.sv", "w") as file:
            file.write(templates.generate_compatible_finn_sv(bd_name))
            sv_file = f"{script_dir}/{file.name}"
            print("Wrapper do FINN Chiplet gerado com sucesso!")

        # Escreve o script TCL em um arquivo
        with open("script.tcl", "w") as file:
            file.write(templates.generate_tcl_script(
                proj_base_path=proj_base_path.absolute().as_posix(),
                project_name=project_name,
                script_dir=script_dir,
                bd_name=bd_name,
                sv_file=sv_file,
                finn_name=finn_name,
                feeder_name=feeder_name,
                fpga_board_name=fpga_board_name,
                isWindows=isWindows,
                id_width=3,
                user_width=2,
                verilog_define="USE_FINN"
            ))
            print("Script TCL gerado com sucesso!")

        # if isWindows:
        #     print("Abra o script no Vivado")
        #     print(f"Tools > Run Tcl Script... > {script_dir}/script.tcl")
        # else:
            # Executa o comando Vivado no terminal
        print("Executando Vivado...")
        cmd = f"vivado -mode batch -source ./script.tcl"
        process = util.execute_cmd(cmd)

        # Verifica o resultado
        if process.returncode == 0:
            print("\nScript TCL executado com sucesso!")
        else:
            print("\nErro ao executar o script TCL no Vivado.")
            print("Saída de erro:")
            print(process)
        return process.returncode
    else: 
        print("Algum dos caminhos está errado")            
        print(proj_base_path) 
        print(proj_base_path/f"{project_name}.xpr")        
        return 1 

if __name__ == "__main__":
    sys.exit(main())