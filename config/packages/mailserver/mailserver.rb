package :mailserver do

  packages = [
    # :postfix,
    # :mailutils,
    # :libsasl2_2,
    # :ca_certificates,
    # :libsasl2_modules,
    :configure_gmail,
  ]

  packages.each do |package|
    requires package
  end

end