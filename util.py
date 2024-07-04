import numpy as np
from typing import List
import subprocess
import xml.etree.ElementTree as ET
import json
import custom_types as ct

def extract_ip_vlnv(xml_file):
    try:
        # Parseia o arquivo XML
        tree = ET.parse(xml_file)
        root = tree.getroot()

        # Define os namespaces que serão usados nos elementos
        namespaces = {
            'spirit': 'http://www.spiritconsortium.org/XMLSchema/SPIRIT/1685-2009'
        }

        # Extrai os elementos desejados
        vendor = root.find('spirit:vendor', namespaces).text
        library = root.find('spirit:library', namespaces).text
        name = root.find('spirit:name', namespaces).text
        version = root.find('spirit:version', namespaces).text

        # Retorna os elementos extraídos como um dicionário
        return {
            'vendor': vendor,
            'library': library,
            'name': name,
            'version': version
        }
    except Exception as e:
        print(f"Erro ao processar o arquivo XML: {str(e)}")
        return None

def extract_io_bits(xml_file : str) -> ct.IOBits :
    try:
        # Parseia o arquivo XML
        tree = ET.parse(xml_file)
        root = tree.getroot()

        # Define os namespaces que serão usados nos elementos
        namespaces = {
            'spirit': 'http://www.spiritconsortium.org/XMLSchema/SPIRIT/1685-2009'
        }

        results = {}

        # Função auxiliar para encontrar e incrementar o valor de TDATA_NUM_BYTES para um dado busInterface name
        def find_and_increment(interface_name):
            xpath = f".//spirit:busInterface[spirit:name='{interface_name}']//spirit:parameter[spirit:name='TDATA_NUM_BYTES']/spirit:value"
            num_bytes_element = root.find(xpath, namespaces)
            if num_bytes_element is not None:
                num_bytes_value = int(num_bytes_element.text)
                results[interface_name] = num_bytes_value * 8
            else:
                print(f"Elemento TDATA_NUM_BYTES não encontrado para busInterface '{interface_name}'.")

        # Procurando pelos elementos específicos
        find_and_increment("s_axis_0")
        find_and_increment("m_axis_0")

        return results

    except Exception as e:
        print(f"Erro ao processar o arquivo XML: {str(e)}")
        return None
    
def execute_cmd(cmd : str) -> subprocess.CompletedProcess[bytes] | subprocess.CalledProcessError:
    try:
        process = subprocess.run(cmd, shell=True, check=True)
    except subprocess.CalledProcessError as e:
        return e
    return process

def multiply_elements(arr: List[int]) -> int:
    if not arr:
        raise ValueError("A lista não pode estar vazia.")
    
    return np.prod(arr)

def read_json_file(file_path):
    with open(file_path, 'r') as file:
        data = json.load(file)
    return data

def get_finn_ip_path(script_dir : str, finn_name : str) -> str:
    return f"{script_dir}/IPs/FINN_ips/{finn_name}/ip"

# Exemplo de uso


# def clean_project ():
#     print("Limpando o projeto")
#     cmd = f"vivado -mode batch -source ./clean_script.tcl"
#     clean_process = execute_cmd(cmd)
#     if clean_process.returncode == 0:
#         print("Projeto limpado com sucesso!")
#     else:
#         print_error(clean_process)