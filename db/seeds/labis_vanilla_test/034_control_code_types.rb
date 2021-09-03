Object.const_set("ControlCodeType", Class.new(ApplicationRecord))
ControlCodeType.find_or_create_by({"description"=>"Diagnosis Code"})
ControlCodeType.find_or_create_by({"description"=>"Cytology Study"})
ControlCodeType.find_or_create_by({"description"=>"Addendum Text"})
ControlCodeType.find_or_create_by({"description"=>"Image Caption"})
ControlCodeType.find_or_create_by({"description"=>"Case Comment"})
ControlCodeType.find_or_create_by({"description"=>"Grossing Code"})
ControlCodeType.find_or_create_by({"description"=>"Flow Code"})
ControlCodeType.find_or_create_by({"description"=>"Prostate Code"})