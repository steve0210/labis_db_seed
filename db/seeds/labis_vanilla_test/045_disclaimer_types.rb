Object.const_set("DisclaimerType", Class.new(ApplicationRecord))
DisclaimerType.find_or_create_by({"name"=>"Disclaimers"})
