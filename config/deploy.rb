require "bundler/capistrano"

set :application, "alanyaproperties"
set :deploy_to, "/var/www/#{application}"

set :scm, :git
set :repository,  "git@github.com:faustman/alanya.git"
set :deploy_via, :remote_cache
ssh_options[:forward_agent] = true

set :user, "deploy" # you could even do `set :user, application` here
# cap assumes you want to do things with sudo on remote servers, we don't and in fact
# intentionally can't, no problem:
set :use_sudo, false

server "198.211.121.83", :app, :web, :db, :primary => true

set :keep_releases, 5
# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

set :shared_children, shared_children + %w{public/uploads solr}

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
