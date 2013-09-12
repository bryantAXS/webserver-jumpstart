## Provision Server

1. Rename ```_deploy.rb``` to ```deploy.rb```
2. Configure ```deploy.rb``` file
3. Adjust ```packages/mysql/mysql_secure_installation_no_ask``` and add custom passwords
4. Adjust ```packages/mailserver/postfix/templates/*``` files and set correct settings

## Create V-host for initial site

run ```cap -T ``` to view apache related commands

## ToDo

* Configure templates inside Postfix package, so we don't need modify them pre-install
* Configure templates for mysql_secure_installation_no_ask
* Debug update_ssh_config package -- allowing deployer user to run sudo commands

