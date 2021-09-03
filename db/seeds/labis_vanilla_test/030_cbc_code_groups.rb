Object.const_set("CbcCodeGroup", Class.new(ActiveRecord::Base))
CbcCodeGroup.find_or_create_by({"name"=>"Dropdown"})
