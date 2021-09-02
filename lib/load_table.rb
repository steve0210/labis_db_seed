require File.join('.', 'lib', 'dyn_table')

class LoadTable < DynTable
  attr_accessor :file

  QUERIES = {
    "ReferringPhysician" => Proc.new do |tc|
      tc.where(last_name: ["TALBOTT", "SILBERMAN", "SILVERMAN", "Smtih", "Barry"])
    end,
    "ClientAccount" => Proc.new do |tc|
      tc.where("account_name like ? or account_name like ? or account_number like ?", "ANY LAB%", "%Test%", "DEMO%")
    end,
    "ClientAccountTodo" => Proc.new do |tc|
      tc.where(client_account_id: query(ClientAccount))
    end,
    "ClientAccountLocation" => Proc.new do |tc|
      tc.where(client_account_id: query(ClientAccount))
    end,
    "ClientAccountLocationReportPreference" => Proc.new do |tc|
      tc.where(client_account_location_id: query(ClientAccountLocation))
    end,
    "ClientAccountLocationsClientAccountPhysician" => Proc.new do |tc|
      tc.where(client_account_location_id: query(ClientAccountLocation))
    end,
    "ClientAccountPhysician" => Proc.new do |tc|
      tc.where(id: query(ClientAccountLocationsClientAccountPhysician, :client_account_physician_id))
    end
  }

  def self.query(tc, id = :id)
    QUERIES[tc.name].call(tc.select(id)).map { |x| x.send(id) }
  end

  def excluded_keys
    ["created_at", "updated_at", "id"]
  end

  def serialized_record(rec)
    rec.serializable_hash.delete_if do |k, v|
      v.blank? || excluded_keys.include?(k)
    end.tap do |h|
      h.keys.each do |k|
        h[k] = %{#{h[k]}} if quote_object?(h[k].class)
      end
    end
  end

  def quote_object?(klass)
    klass == ActiveSupport::TimeWithZone || klass == Date
  end

  def file_record(rec)
    if rec.id && rec.id.class == Integer
      %{#{class_name}.create_with(#{serialized_record(rec)}).find_or_create_by(id: #{rec.id})}
    else
      %{#{class_name}.find_or_create_by(#{serialized_record(rec)})}
    end
  end

  def init_file
    if tn = TABLES[class_name]
      %{Object.const_set("#{class_name}", Class.new(ApplicationRecord) { self.table_name = "#{tn}" })}
    else
      %{Object.const_set("#{class_name}", Class.new(ApplicationRecord))}
    end
  end

  def query
    (q = QUERIES[class_name]) ? q.call(table_class) : table_class.all
  end

  def write_file
    File.open(file, "w") do |o|
      o.puts init_file
      query.each do |rec|
        Rails.logger.debug "writing record of #{class_name}: #{rec.id}"
        o.puts file_record(rec)
      end
    end
  end
end
