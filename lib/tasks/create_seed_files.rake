namespace :db do
  desc "Load table data into seed files"
  task create_seed_files: [:environment] do
    require File.join('.', 'lib', 'write_seeds')
    WriteSeeds.new.write_files
  end

  desc "Dump table schema"
  task schema_dump_cp: [:environment] do
    Rake::Task["db:schema:dump"].invoke
    require File.join('.', 'lib', 'write_seeds')
    WriteSeeds.cp_schema_out
  end

  desc "Data load"
  task data_load: [:environment] do
    %x{#{create_db_user}}
    schema_load_cp
    Rake::Task["db:seed"].invoke
  end

  def create_db_user
    config = Rails.configuration.database_configuration[Rails.env]
    password = config["password"]
    username = config["username"]
    database = config["database"]
    host = config["host"]
    
    createuser = %{CREATE USER IF NOT EXISTS '#{username}' IDENTIFIED BY '#{password}'}
    createdb = %{CREATE DATABASE IF NOT EXISTS #{database}}
    grantuser = %{GRANT ALL PRIVILEGES ON #{database}.* TO #{username}}
    %{mysql -h #{host} -u root -e "#{[createdb, createuser, grantuser].join(%{; })}"}
  end

  def schema_load_cp
    unless ActiveRecord::Base.connection.table_exists? 'users'
      require File.join('.', 'lib', 'write_seeds')
      WriteSeeds.cp_schema_in
      Rake::Task["db:schema:load"].invoke
    end
  end
end
