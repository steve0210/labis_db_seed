Object.const_set("DefaultAmendmentReason", Class.new(ActiveRecord::Base))
DefaultAmendmentReason.find_or_create_by({"description"=>"Clerical Error"})
DefaultAmendmentReason.find_or_create_by({"description"=>"Clinical Error"})
DefaultAmendmentReason.find_or_create_by({"description"=>"Additional diagnostic material"})
DefaultAmendmentReason.find_or_create_by({"description"=>"Other"})
