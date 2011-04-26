require "bundler/capistrano"

set :application, "codykrieger.com"
set :repository,  "git://github.com/codykrieger/codykrieger.com"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :use_sudo, false
set :deploy_to, "~/#{application}"
set :deploy_via, :remote_cache

role :web, "codykrieger.com"                          # Your HTTP server, Apache/etc
role :app, "codykrieger.com"                          # This may be the same as your `Web` server
role :db,  "codykrieger.com", :primary => true # This is where Rails migrations will run

task :after_update_code do
  run "ln -nfs #{deploy_to}/#{shared_dir}/config/database.yml #{release_path}/config/database.yml"
end

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
