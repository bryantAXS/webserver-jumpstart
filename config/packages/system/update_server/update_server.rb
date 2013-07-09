package :update_server do

  # runner "apt-get -f install"
  runner "sudo aptitude -y update"
  runner "sudo aptitude -y upgrade"

  # Need to find a way to verify this
  # verify do
  # end

end