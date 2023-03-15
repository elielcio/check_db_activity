#!/bin/bash

# Configurações de conexão ao banco de dados
MYSQL_USER=<user>
MYSQL_PASSWORD=<pass>
MYSQL_HOST=<host>
MYSQL_PORT=3306
MYSQL_DATABASE=<db> #necessário adaptar o codigo, caso seja para mais de um banco de dados

# Obtém todas as conexões ativas no banco de dados
CONNECTIONS=$(mysql -u$MYSQL_USER -p$MYSQL_PASSWORD -h$MYSQL_HOST -P$MYSQL_PORT -N -B -e "SELECT CONCAT('KILL ',id,';') FROM information_schema.processlist WHERE user <> 'system user' AND command = 'sleep' AND db = '$MYSQL_DATABASE' AND ( TIME > 20 OR TIME = 0)")

# Encerra todas as conexões ativas com mais de 2 minutos de inatividade
echo $CONNECTIONS
if [[ -n "$CONNECTIONS" ]]; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - conexoes finalizadas: $CONNECTIONS"
    mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -h $MYSQL_HOST -P$MYSQL_PORT -N -B -e "$CONNECTIONS"
fi