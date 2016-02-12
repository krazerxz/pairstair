require "whenever/capistrano"

lock "3.4.0"

set :application, "pairstair"
set :pty, true
set :repo_url, "http://gitlab.nat.bt.com/nimboids/pairstair.git"
set :default_env, 'GIT_SSL_NO_VERIFY': "true"

set :deploy_to, "/home/pairstair/pairstair"

set :rails_env, "production"
set :linked_files, %w(config/secrets.yml config/database.yml config/puma.rb config/application.yml)

set :bundle_flags, "--retry 10 --deployment"

set :whenever_command, "bundle exec whenever"
set :puma_conf, "/home/pairstair/pairstair/shared/config/puma.rb"

set :rbenv_type, :system
set :rbenv_ruby, File.read('.ruby-version').strip
set :rbenv_path, "/opt/rbenv/"
set :rbenv_prefix,
  "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
