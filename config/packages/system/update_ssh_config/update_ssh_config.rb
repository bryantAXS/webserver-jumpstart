package :update_ssh_config do

    packages = [
    :update_ssh_port
    #:update_root_login
  ]

  packages.each do |package|
    requires package
  end

end

package :update_ssh_port do
  replace_text "Port 22", "Port 24", "/etc/ssh/sshd_config"
  verify do
    file_contains "/etc/ssh/sshd_config", "Port 24"
  end
end


package :update_root_login do
  replace_text "PermitRootLogin yes", "PermitRootLogin no", "/etc/ssh/sshd_config"
  verify do
    file_contains "/etc/ssh/sshd_config", "PermitRootLogin no"
  end
end