Object.const_set("ReportType", Class.new(ActiveRecord::Base))
ReportType.find_or_create_by({"description"=>"Final"})
ReportType.find_or_create_by({"description"=>"Amendment"})
ReportType.find_or_create_by({"description"=>"Addendum"})
ReportType.find_or_create_by({"description"=>"Correction"})
ReportType.find_or_create_by({"description"=>"Preliminary"})
