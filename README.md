## Descrição
Script de Finalização de Conexões Inativas em Banco de Dados MySQL
Este script shell foi desenvolvido para finalizar conexões inativas em um banco de dados MySQL que tenham mais de 2 minutos de inatividade.

### Pré-requisitos
Antes de executar o script, certifique-se de ter:

Acesso ao servidor onde o banco de dados MySQL está hospedado;
Permissões de execução no script;
Acesso ao usuário do banco de dados com privilégios para finalizar conexões.

### Dependências
O script depende do pacote mysql-client, que pode ser instalado nos seguintes sistemas operacionais:

Debian/Ubuntu
sudo apt-get update
sudo apt-get install mysql-client -y

CentOS/RHEL
sudo yum update
sudo yum install mysql -y

### Instalação
1. Clone este repositório em sua máquina local:
   git clone https://github.com/elielcio/check_db_activity.git /usr/local/scripts/check_db_activity/

2.Acesse o diretório do repositório:
    cd /usr/local/scripts/check_db_activity

3.Dê permissão de execução para o script:
   sudo chmod +x /usr/local/scripts/check_db_activity/check_db_activity.sh

O script pode ser executado periodicamente usando uma ferramenta de agendamento, como o cron. Por exemplo, para executar o script a cada 5 minutos, adicione a seguinte linha ao arquivo crontab:

*/5 * * * * /usr/local/scripts/check_db_activity/check_db_activity.sh 2>&1