package :webserver do
  packages = [:build_essential, :git, :curl, :htop, :unzip, :apache]
  packages.each { |p| requires p }
end
