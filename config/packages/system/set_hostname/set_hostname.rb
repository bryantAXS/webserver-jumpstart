package :set_hostname do

  hostname = Package.fetch(:hostname)

  runner "echo '#{hostname}' > /etc/hostname"
  runner "hostname -F /etc/hostname"

  verify do
    file_contains "/etc/hostname", hostname
  end

end