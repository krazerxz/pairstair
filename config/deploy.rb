require "whenever/capistrano"

lock "3.4.0"

set :application, "pairstair"
set :pty, true
set :repo_url, "http://gitlab.nat.bt.com/nimboids/pairstair.git"
set :default_env, 'GIT_SSL_NO_VERIFY': "true"

set :deploy_to, "/home/pairstair/pairstair"

set :rails_env, "production"
set :linked_files, %w(config/secrets.yml config/database.yml config/application.yml)

set :bundle_flags, "--retry 10 --deployment"

set :whenever_command, "bundle exec whenever"

namespace :deploy do
  desc "restart web app"
  task :restart_web_app do
    on roles(:app), in: :sequence, wait: 5 do
      execute :sudo, :service, "pairstair_puma", "restart"
    end
  end

  after :deploy, "deploy:restart_web_app"
end

#
#
set :rbenv_type, :system
set :rbenv_ruby, File.read('.ruby-version').strip
set :rbenv_path, "/opt/rbenv/"
set :rbenv_prefix,
  "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
