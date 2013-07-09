package :set_timezone do

  timezone = Package.fetch(:timezone)

  runner "ln -s -f /usr/share/zoneinfo/#{timezone} /etc/localtime"

  verify do
    file_contains "/etc/timezone", "Etc/UTC"
  end

end