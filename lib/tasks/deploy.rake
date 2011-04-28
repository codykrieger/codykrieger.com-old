require 'whiskey_disk/helpers'

namespace :deploy do

  task :create_rails_dirs do
    if role? :www
      puts "Creating log/ and tmp/ directories..."
      Dir.chdir Rails.root
      system "mkdir -p log tmp"
    end
  end

  task :run_migrations do
    if role?(:db) and changed?('db/migrate')
      puts "Running database migrations..."
      Rake::Task['db:migrate'].invoke
    end
  end

  task :symlinkage do
    puts "Symlinking config/database.yml..."
    system "ln -nfs ~/codykrieger.com.database.yml #{File.join Rails.root, 'config', 'database.yml'}"

    puts "Symlinking files directory..."
    system "ln -nfs ~/downloads #{File.join Rails.root, 'files'}"
  end

  task :restart_app do
    system "touch #{File.join Rails.root, 'tmp', 'restart.txt'}"
  end

  task :post_setup => [:create_rails_dirs, :symlinkage]
  task :post_deploy => [:run_migrations, :restart_app]
end
