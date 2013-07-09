package :set_fqdn do

  hostname = Package.fetch(:hostname)
  ipaddress = Package.fetch(:ip)
  domain = Package.fetch(:domain)
  suffix = domain.split(".")[1] if domain

  runner "echo '#{ipaddress}    #{hostname}.#{domain}.#{suffix}    #{hostname}' >> /etc/hosts"

  verify do
    file_contains "/etc/hosts", "#{ipaddress}    #{hostname}.#{domain}.#{suffix}    #{hostname}"
  end

end