Object.const_set("IhcTransportType", Class.new(ActiveRecord::Base))
IhcTransportType.find_or_create_by({"description"=>"Paraffin Embedded"})
IhcTransportType.find_or_create_by({"description"=>"Formalin Fixed"})
IhcTransportType.find_or_create_by({"description"=>"Alcohol Fixed"})
IhcTransportType.find_or_create_by({"description"=>"Air Dried"})
IhcTransportType.find_or_create_by({"description"=>"Other"})
