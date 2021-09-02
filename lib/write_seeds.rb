require File.join('.', 'lib', 'load_table')

class WriteSeeds
  CREATE_ENV = {
    "labis_production" => "labis_test"
    "labis_vanilla_production" => "labis_vanilla_test"
  }

  def self.prod_env
    @test_env ||= CREATE_ENV.key(Rails.env)
  end

  def self.test_env
    @test_env ||= CREATE_ENV[Rails.env]
  end

  def self.cp_schema_out
    Rails.logger.debug "Copy schema out to #{Rails.env}"
    cp_schema("schema", "#{Rails.env}.schema")
  end

  def self.cp_schema(inx, out)
    FileUtils.cp(File.join(".", "db", "#{inx}.rb"), File.join(".", "db", "#{out}.rb"))
  end

  def self.cp_schema_in
    Rails.logger.debug "Copy schema in from #{prod_env}"
    cp_schema("#{prod_env}.schema", "schema")
  end

  def tables_file
    File.join(".", "config", "tables", "#{Rails.env}.yml")
  end

  def tables
    @tables ||= YAML.load(File.read(tables_file))["tables"]
  end

  def table_file(table, index)
    File.join(".", "db", "seeds", self.class.test_env, %{#{%{%03d} % index}_#{table}.rb})
  end

  def load_table(table, index)
    unless File.exists?(file = table_file(table, index))
      LoadTable.new(file: file, table: table)
    end
  end

  def write_files
    tables.each_with_index do |table, index|
      Rails.logger.debug "Writing table: #{table} : #{index + 1}"
      load_table(table, index + 1).try(:write_file) if table
    end
  end
end
