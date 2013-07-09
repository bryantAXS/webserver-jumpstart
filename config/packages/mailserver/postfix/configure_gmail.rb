package :configure_gmail do

  packages = [
    :upload_main,
    :upload_sasl,
    :upload_mailname,
    :set_postfix_permissions,
    :configure_postfix,
    :restart_postfix
  ]

  packages.each do |package|
    requires package
  end

end

package :upload_main do
  @domain = Package.fetch("domain") || ""
  @hostname = Package.fetch("hostname") || ""

  puts @domain
  puts @hostname

  #file "/etc/postfix/main.cf", :contents => render("main.cf")

  transfer File.join(File.dirname(__FILE__),"templates","main.cf"), "/etc/postfix/main.cf"
  verify{ has_file "/etc/postfix/main.cf" }

end

package :upload_sasl do
  transfer File.join(File.dirname(__FILE__),"templates","sasl_passwd"), "/etc/postfix/sasl_passwd"
  verify{ has_file "/etc/postfix/sasl_passwd" }
end

package :upload_mailname do
  transfer File.join(File.dirname(__FILE__),"teamplates","mailname"), "/etc/mailname"
  verify{ has_file "/etc/mailname" }
end

package :set_postfix_permissions do
  runner "chmod 400 /etc/postfix/sasl_passwd"
end

package :configure_postfix do
  runner "postmap /etc/postfix/sasl_passwd"
  runner "cat /etc/ssl/certs/Thawte_Premium_Server_CA.pem | sudo tee -a /etc/postfix/cacert.pem"
end

package :restart_postfix do
  runner "/etc/init.d/postfix stop"
  runner "/etc/init.d/postfix start"
end



