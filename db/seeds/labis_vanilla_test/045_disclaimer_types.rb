Object.const_set("DisclaimerType", Class.new(ActiveRecord::Base))
DisclaimerType.find_or_create_by({"name"=>"Disclaimers"})
