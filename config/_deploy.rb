require File.expand_path("#{File.dirname(__FILE__)}/cap-apache/apachetasks")

# Connection and Application stuff
set :ip, ""
set :application, ""                      # yourdomain.com or sub.yourdomain.com
set :domain, ""                           # same as above
set :subdomain, true                      # is this a subdomain?

# User we use to connect
set :user, ''                             # after setting up box, this should be set to 'deployer'
set :password, ''

# Uncomment this after the server configuration has taken place (originally 22 by default)
# set :port, 24

# Server configuration stuff
set :hostname, ""                         # can really be anything, typically your site name
set :timezone, "America/Chicago"

# Postfix (email) config
set :gamil_address, ""                    # test@yourdomain.com
set :gmail_password, ""
set :mailname, ""                         # an email address the server should use to identify itself

# Absolute path of public keys you want to add
set :public_keys, ["/Users/bryanthughes/.ssh/id_rsa.pub", "/Users/bryanthughes/.ssh/chris_id_rsa.pub"]

# This is for creating a site's deploy location and vhost file -- not for the actual webserver provisioning
set :deploy_to, ""                        # absolute path on server of where you want to deploy to
set :doc_root, "public"                   # within your codebase, the location of your docroot

# Just run the commands since we are 'root'.
set :run_method, :run

# Roles
role :app, ""                             # ip address
role :web, ""                             # ip address
role :db,  "", :primary => true           # ip address

default_run_options[:pty] = true

if defined?(Sprinkle) then
  Sprinkle::Package::Package.set_variables = self.variables
end