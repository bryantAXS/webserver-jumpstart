## Provision Server

1. Setup ```deploy.rb``` file
2. Adjust ```packages/mysql/mysql_secure_installation_no_ask``` and add custom passwords
3. Adjust ```packages/mailserver/postfix/templates/*``` files and set correct settings

## Create V-host

run ```cap -T ``` to view apache related commands

## Sync remote and local assets

run ```cap -T ``` to view sync commands, note: this has not been tested thouroughly

## ToDo

* Configure templates inside Postfix package, so we don't need modify them pre-install
* Configure templates for mysql_secure_installation_no_ask
* Debug update_ssh_config package -- allowing deployer user to run sudo commands

