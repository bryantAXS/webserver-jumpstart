package :setup_fail2ban do

  apt "fail2ban"
  transfer File.join(File.dirname(__FILE__), "jail.conf"), "/etc/fail2ban/jail.local"
  runner "service fail2ban restart"

  verify do
    has_apt 'fail2ban'
    has_file "/etc/fail2ban/jail.local"
  end

end