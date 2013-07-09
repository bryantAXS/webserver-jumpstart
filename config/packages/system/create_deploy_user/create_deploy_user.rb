package :create_deploy_user do

  runner "useradd -m -p ad23s6d5efs5s6d21 deployer"
  runner "usermod -a -G sudo deployer"
  runner "mkdir /home/deployer/.ssh"
  runner "touch /home/deployer/.ssh/authorized_keys"
  runner "chown -R deployer /home/deployer/.ssh"

  sudo_text = "deployer ALL=NOPASSWD: ALL"
  push_text sudo_text, "/etc/sudoers"

  verify do
    has_directory "/home/deployer/.ssh"
    has_file "/home/deployer/.ssh/authorized_keys"
    #file_contains "/etc/sudoers", "deployers ALL=NOPASSWD: ALL"
  end

end