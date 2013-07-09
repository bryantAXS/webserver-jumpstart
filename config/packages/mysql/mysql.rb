package :mysql do

  packages= [
    :mysql_server,
    :mysql_secure_installation,
    :optimize_mysql_config
  ]

  packages.each { |p| requires p }

end

package :mysql_server do
  apt "mysql-server"
  verify { has_apt "mysql-server"}
end

package :mysql_secure_installation do

  apt "expect"

  transfer File.join(File.dirname(__FILE__),"mysql_secure_installation_no_ask"), "/usr/local/mysql/scripts/mysql_secure_installation_no_ask" do
    pre :install, "mkdir -p /usr/local/mysql/scripts"
    post :install, "chmod +x /usr/local/mysql/scripts/mysql_secure_installation_no_ask"
  end

  runner "expect /usr/local/mysql/scripts/mysql_secure_installation_no_ask"

  verify { has_file "/usr/local/mysql/scripts/mysql_secure_installation_no_ask" }
end

package :optimize_mysql_config do
  transfer File.join(File.dirname(__FILE__),"myconf.cnf"), "/etc/mysql/conf.d/myconf.cnf" do
    post :install, "service mysql stop"
    post :install, "service mysql start"
  end
  verify { has_file "/etc/mysql/conf.d/myconf.cnf" }
end

