package :postfix do
  apt "postfix"
  verify { has_apt "postfix"}
end

package :mailutils do
  apt "mailutils"
  verify { has_apt "mailutils"}
end

package :libsasl2_2 do
  apt "libsasl2-2"
  verify { has_apt "libsasl2-2"}
end

package :ca_certificates do
  apt "ca-certificates"
  verify { has_apt "ca-certificates"}
end

package :libsasl2_modules do
  apt "libsasl2-modules"
  verify { has_apt "libsasl2-modules"}
end