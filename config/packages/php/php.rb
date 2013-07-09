package :php do
  packages = [
    :python_software_properties,
    :php5,
    :php5_mysql,
    :php5_curl,
    :php5_gd,
    :php5_apc,
    :php5_xsl,
    :php5_xmlrpc,
    :php5_tidy,
    :php5_ming,
    :php5_mcrypt,
    :php5_imap
  ]
  packages.each { |p| requires p }
end

package :python_software_properties do
  apt 'python-software-properties'
  verify { has_apt 'python-software-properties' }
end

package :php5 do

  runner "echo '\n\n\n' | add-apt-repository ppa:ondrej/php5"

  packages = %w(php5 php5-dev php-pear php5-xcache)

  apt packages do
    pre :install, ['apt-get update']
  end

  verify do
    packages.each { |p| has_apt p }
  end

end

package :php5_mysql do
  requires :mysql
  apt 'php5-mysql'
  verify { has_apt 'php5-mysql' }
end

package :php5_curl do
  requires :curl
  apt 'php5-curl'
  verify { has_apt 'php5-curl' }
end

package :php5_gd do
  apt 'php5-gd'
  verify { has_apt 'php5-gd' }
end

package :php5_apc do
  apt 'php-apc'
  verify { has_apt 'php-apc' }
end

package :php5_xsl do
  apt 'php5-xsl'
  verify { has_apt 'php5-xsl'}
end

package :php5_xmlrpc do
  apt 'php5-xmlrpc'
  verify { has_apt 'php5-xmlrpc'}
end

package :php5_tidy do
  apt 'php5-tidy'
  verify { has_apt 'php5-tidy'}
end

package :php5_ming do
  apt 'php5-ming'
  verify { has_apt 'php5-ming'}
end

package :php5_mcrypt do
  apt 'php5-mcrypt'
  verify { has_apt 'php5-mcrypt'}
end

package :php5_imap do
  apt 'php5-imap'
  verify { has_apt 'php5-imap'}
end