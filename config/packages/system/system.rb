package :system do

  packages = [
    :set_hostname,
    :set_fqdn,
    :set_timezone,
    :create_deploy_user,
    :add_public_keys,
    :update_server,
    :update_ssh_config,
    :setup_fail2ban,
    :setup_firewall,
    :setup_reboot
  ]

  packages.each { |p| requires p }

end