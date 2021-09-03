Object.const_set("CbcCodeGroup", Class.new(ApplicationRecord))
CbcCodeGroup.find_or_create_by({"name"=>"Dropdown"})
