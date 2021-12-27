#!/bin/bash +x
#
# Add ip address to firewall rule on azure sql server
# 
# Requirments for running the script:
#   - installe azure cli (https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
#   - log in to azure with the azure cli (run az login)
# 
# 

section=$(echo $1 | tr '[a-z]' '[A-Z]')
name=${2:-$(whoami)}
ip_address=$(curl --silent -4 ifconfig.co)

group=$(eval echo "\$AZURE_${section}_GROUP")
server=$(eval echo "\$AZURE_${section}_SERVER")

az sql server firewall-rule create \
    --resource-group $group \
    --server $server \
    --name $name \
    --start-ip-address $ip_address \
    --end-ip-address $ip_address