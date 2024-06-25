import xml.etree.ElementTree as ET

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
