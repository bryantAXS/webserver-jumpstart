require File.join(File.dirname(__FILE__), 'base')

policy :myapp, :roles => :app do
  requires :system
  requires :webserver
  requires :php
  requires :mysql
  requires :mailserver
  requires :cleanup
end

deployment do
  delivery :capistrano do
    recipes 'deploy'
  end

  source do
    prefix   '/usr/local'
    archives '/usr/local/sources'
    builds   '/usr/local/build'
  end
end
