# Provisionamento das instâncias do cloud storage com Terraform
O objetivo desse projeto é provisionar as instâncias do cloud storage utilizando o terraform como "infra-as-code", aplicando as melhores práticas de mercado como o uso de módulos, que serve para reutilizar código apenas alterando parâmetros para subir diferentes recursos.
No caso do diretório tf-storage, o código **main.py** contém as configurações do recurso que será provisionado, enquanto no diretório modules é possível criar N-módulos para subir diferentes instâncias do cloud storage, apenas alterando parâmetros para cada instância.
## Pré-requisitos para desenvolvimento e deploy
- Instalação do Terraform
    - Para instalar o terraform basta baixar o binário e adicioná-lo as variáveis de ambiente do SO.
    - [Linux Binary](https://releases.hashicorp.com/terraform/1.2.8/terraform_1.2.8_linux_amd64.zip)
    - [Windows Binary](https://releases.hashicorp.com/terraform/1.2.8/terraform_1.2.8_windows_amd64.zip)
- Para adicionar o binário no ambiente linux
  
    1. É possível adicionar aos PATHs já existentes no próprio ambiente
    ```
    echo $PATH
    ```
    Basta copiar/mover o binário para um dos diretórios listados na saída do comando a cima (os diretórios estão separados por ":").
    2. Ou criar um próprio diretório de binários e adicionar no perfil do usuário:
    ```
    mkdir $HOME/{path_de_preferência};
    cp terraform_binary $HOME/{path_de_preferência};
    echo '$PATH:$HOME/{path_de_preferência}' >> $HOME/.bashrc;
    source $HOME/.bashrc
    ```
    > **Dica** - Antes do passo 2 faça um backup do arquivo $HOME/.bashrc
- Para adicionar novos módulos (recurso)
  
    1. Editar o arquivo em **modules/storage.tf** e seguir basicamente o que já existe nesse arquivo como exemplo
  
    2. Atualizar os módulos dentro da pasta modules:
    ```
    cd modules;
    terraform get -update
    ```
  
    3. Provisionar:
    ```
    terraform apply
    ```
    OU
    ```
    terraform apply -target=module.dev.google_storage_environment.job
    ```
    > **Análise** - Checar plano de execução antes de confirmar o apply