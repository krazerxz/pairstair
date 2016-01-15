require "whenever/capistrano"

lock "3.4.0"

set :application, "pairstair"
set :pty, true
set :repo_url, "git@gitlab.nat.bt.com:chris.pomfret/pairstair.git"

set :deploy_to, "/home/pairstair/pairstair"

set :rails_env, "production"
set :linked_files, %w(config/secrets.yml config/database.yml config/application.yml)

set :bundle_flags, "--retry 10 --deployment"

set :whenever_command, "bundle exec whenever"

namespace :deploy do
  desc "restart web app"
  task :restart_web_app do
    on roles(:app), in: :sequence, wait: 5 do
      execute! :sudo, :service, "pairstair_puma", "restart"
    end
  end

  after :deploy, "deploy:restart_web_app"
end
