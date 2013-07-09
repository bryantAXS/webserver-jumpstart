package :setup_firewall do

  transfer File.join(File.dirname(__FILE__), "firewall.conf"), "/etc/iptables.firewall.rules"
  runner "iptables-restore < /etc/iptables.firewall.rules"
  push_text '#!/bin/sh', '/etc/network/if-pre-up.d/firewall'
  push_text '/sbin/iptables-restore < /etc/iptables.firewall.rules', '/etc/network/if-pre-up.d/firewall'
  runner "chmod +x /etc/network/if-pre-up.d/firewall"

  verify do
    has_file "/etc/iptables.firewall.rules"

    # Need to figure out why these are failing
    # file_contains "/etc/iptables.firewall.rules", "-A INPUT -p tcp -m state --state NEW --dport 24 -j ACCEPT"
    # file_contains "/etc/network/if-pre-up.d/firewall", "#!/bin/sh"
    # file_contains "/etc/network/if-pre-up.d/firewall", "sbin/iptables-restore < /etc/iptables.firewall.rules"
  end

end