package :apache do
  packages = [
    :apache2,
    # :libapache2_mod_ruby,
    :libapache2_mod_php5,
    :enable_mod_rewrite
  ]

  packages.each { |p| requires p }
end

package :apache2 do
  apt "apache2"
  verify {
    has_apt "apache2"
  }
end

package :libapache2_mod_ruby do
  apt "libapache2-mod-ruby"
  verify { has_apt "libapache2-mod-ruby"}
end

package :libapache2_mod_php5 do
  apt "libapache2-mod-php5"
  verify { has_apt "libapache2-mod-php5"}
end

package :enable_mod_rewrite do
  runner "a2enmod rewrite"
  runner "service apache2 restart"
end
