require File.expand_path("#{File.dirname(__FILE__)}/cap-assets/dbtasks")
require File.expand_path("#{File.dirname(__FILE__)}/cap-apache/apachetasks")

# Connection and Application stuff
set :ip, ""
set :application, ""                # ie: yourdomain.com
set :domain, ""                     # ie: yourdomain.com (same as :application)
set :subdomain, false               # Are we creating a subdomain -- boolean

# User we use to connect
set :user, ''                       # User account for SSH - initially 'root'  with Linode
set :password, ''                   # Password for above account

# Change this to 24 after the server configuration has taken place (originally 22 by default)
# set :port, 24

# Server configuration stuff
set :hostname, "authtest"                                       # Hostname for your server
set :timezone, "America/Chicago"                                # Timezone for server
set :public_keys, ["/Users/bryanthughes/.ssh/id_rsa.pub"]       # Absolute paths to public keys

puts :hostname

set :deploy_to, "/var/www/#{application}"
set :doc_root, "public_html"

# Just run the commands since we are 'root'.
set :run_method, :run

# Roles
role :app, ""
role :web, ""
role :db,  "", :primary => true

# Additional SCM settings
set :scm, :git
set :ssh_options, { :forward_agent => true }
set :deploy_via, :remote_cache
set :copy_strategy, :checkout
set :keep_releases, 3
set :copy_compression, :bz2

# set :repository, ""
# set :branch, "master"

default_run_options[:pty] = true

if defined?(Sprinkle) then
  Sprinkle::Package::Package.set_variables = self.variables
end

# Deployment process
# after "deploy:update", "deploy:cleanup"
# after "deploy:setup", "setup:assign_ownership"
# after "deploy", "deploy:create_symlinks", "deploy:set_permissions"