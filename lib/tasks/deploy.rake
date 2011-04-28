require 'whiskey_disk/helpers'

namespace :deploy do

  task :run_migrations do
    if role?(:db) and changed?('db/migrate')
      puts "Running database migrations..."
      Rake::Task['db:migrate'].invoke
    end
  end

  task :link_db_config do
    puts "Symlinking config/database.yml..."
  end

  task :post_deploy => [:run_migrations, :link_db_config]
end
