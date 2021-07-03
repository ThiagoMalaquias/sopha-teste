require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/bundler'
require 'capistrano/rails'
require 'capistrano/rvm'
set :rvm_type, :user                     # Defaults to: :auto
set :rvm_ruby_version, '2.7.1p83'        # Defaults to: 'default'

require 'capistrano/scm/git'
install_plugin Capistrano::SCM::Git

Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }