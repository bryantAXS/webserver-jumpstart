if Capistrano::Configuration.instance(false)

  Capistrano::Configuration.instance(true).load do |instance|

    #
    # Capistrano Recipe
    #
    namespace :deploy do

      namespace :apache do

        desc "Adds Apache2 configuration and enables it."
        task :create do
          puts "\n\n=== Adding Apache2 Virtual Host for #{domain}! ===\n\n"
          config = <<-CONFIG
          <VirtualHost *:80>
            ServerName #{domain}
            #{unless subdomain then "ServerAlias www.#{domain}" end}
            DocumentRoot #{if doc_root then "/var/www/#{domain}/current/" + doc_root else "/var/www/#{domain}/current" end}
            ErrorLog "/var/www/#{domain}/logs/error_log"
            CustomLog "/var/www/#{domain}/logs/access_log" common
          </VirtualHost>
          CONFIG

          run "sudo mkdir /var/www/#{domain}"
          run "sudo mkdir /var/www/#{domain}/logs"

          system 'mkdir tmp'
          file = File.new("tmp/#{domain}", "w")
          file << config
          file.close
          system "rsync -rvz -e 'ssh -p #{port}' --progress tmp/#{domain} #{user}@#{ip}:/etc/apache2/sites-available/#{domain}.conf"
          File.delete("tmp/#{domain}")
          run "sudo a2ensite #{domain}"
          run "sudo /etc/init.d/apache2 restart"
        end

        desc "Restarts Apache2."
        task :restart do
          run "sudo /etc/init.d/apache2 restart"
        end

        desc "Removes Apache2 configuration and disables it."
        task :destroy do
          puts "\n\n=== Removing Apache2 Virtual Host for #{domain}! ===\n\n"
          begin run("a2dissite #{domain}"); rescue; end
          begin run("sudo rm /etc/apache2/sites-available/#{domain}"); rescue; end
          run("sudo /etc/init.d/apache2 restart")
        end

      end

    end

  end

end