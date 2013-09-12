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

  @domain = Package.fetch(:domain) || ""
  @hostname = Package.fetch(:hostname) || ""

  template_search_path File.dirname(__FILE__)
  file "/etc/postfix/main.cf", :contents => render("tmpl_main.cf")

  verify{ has_file "/etc/postfix/main.cf" }

end

package :upload_sasl do

  @gmail_address = Package.fetch(:gmail_address) || ""
  @gmail_password = Package.fetch(:gmail_password) || ""

  template_search_path File.dirname(__FILE__)
  file "/etc/postfix/sasl_passwd", :contents => render("tmpl_sasl_passwd")

  verify{ has_file "/etc/postfix/sasl_passwd" }

end

package :upload_mailname do

  @mailname = Package.fetch(:mailname) || ""

  template_search_path File.dirname(__FILE__)
  file "/etc/mailname", :contents => render("tmpl_mailname")

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



