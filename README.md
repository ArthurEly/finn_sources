# finn_sources
 Repositório que irá conter os IPs necessários para implementar o FINN no FPGA

Este repositório contém scripts e módulos necessários para configurar e executar projetos com o Vivado, incluindo a integração de IPs personalizados do FINN e do Feeder. A seguir, uma descrição detalhada de cada arquivo e suas funções:

## Arquivos Principais

### `import_finn_to_cv32.py`

Este script é responsável por configurar um projeto no Vivado, criando um design de bloco e conectando os IPs do FINN e do Feeder. Esse script em específico importa um IP pronto para conectar-se a xbar do projeto RISC-V feito por CHI2P. Há também uma versão adaptada para Windows.

### `templates.py`

Este módulo contém funções que geram scripts TCL e arquivos SystemVerilog para integração com o Vivado.

### `util.py`

Este módulo contém funções auxiliares que são usadas pelo `templates.py` para extrair informações de IPs e gerar scripts adequados.

## Configuração e Execução

1. **Configuração:** Altere os parâmetros no início do script `import_finn.py` de acordo com o seu ambiente e projeto.
2. **Execução:** Execute o script `import_finn_to_cv32.py`. Isso irá gerar o arquivo SystemVerilog e o script TCL, e em seguida, executar o Vivado para configurar o projeto.
3. **Vivado:** O script configurará automaticamente o design de bloco no Vivado, adicionando e conectando os IPs do FINN e do Feeder.

## IPs

Os IPs estão na pasta `IPs`, separados em IPs do Feeder e IPs do FINN. Se for adicionar um novo, a nomenclatura só pode conter caracteres alfanuméricos e `_` para que o Vivado consiga achar.

