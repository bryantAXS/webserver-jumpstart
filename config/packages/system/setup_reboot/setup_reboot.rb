package :setup_reboot do

  push_text "vm.panic_on_oom=1", "/etc/sysctl.conf"
  push_text "kernel.panic=10", "/etc/sysctl.conf"

  verify do
    file_contains "/etc/sysctl.conf", "vm.panic_on_oom=1"
    file_contains "/etc/sysctl.conf", "kernel.panic=10"
  end

end