# config valid only for current version of Capistrano
lock '3.5.0'

set :application, 'laracap'
set :repo_url, 'git@github.com:alexander-leitch/laracap.git'

namespace :environment do
    desc "Set environment variables"
    task :set_variables do
        on roles(:app) do
              puts ("--> Create environment configuration file")
              execute "cat /dev/null > #{fetch(:app_path)}/.env"
              execute "echo APP_DEBUG=#{fetch(:app_debug)} >> #{fetch(:app_path)}/.env"
              execute "echo APP_KEY=#{fetch(:app_key)} >> #{fetch(:app_path)}/.env"
        end
    end
end
namespace :composer do
    desc "Running Composer Install"
    task :install do
        on roles(:app) do
            within release_path do
                execute :composer, "install --no-dev"
                execute :composer, "dumpautoload"
            end
        end
    end
end
namespace :deploy do
  after :updated, "composer:install"
  after :finished, "environment:set_variables"
end