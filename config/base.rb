# ======
# This is a base file for the Sprinkle install.
# It does some stuff to pull in all required files and a few overrides,
# ======

# Monkey patch to access Cap variables inside packages
module Sprinkle::Package
  class Package
    @@capistrano = {}

    def self.set_variables=(set)
      @@capistrano = set
    end

    def self.fetch(name)
      @@capistrano[name]
    end

    def self.exists?(name)
      @@capistrano.key?(name)
    end
  end
end

root = File.dirname(__FILE__)

Dir[File.join(root, 'packages', '**', '*.rb')].each { |f| require f }
