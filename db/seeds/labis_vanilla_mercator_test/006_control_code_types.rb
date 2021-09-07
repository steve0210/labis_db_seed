Object.const_set("ControlCodeType", Class.new(ActiveRecord::Base))
ControlCodeType.find_or_create_by({"description"=>"Cytology Study", "tps_id"=>"F8A79AE3-2C13-4B98-B796-1EDD347A4443", "lab_is_id"=>2})
ControlCodeType.find_or_create_by({"description"=>"Addendum Text", "tps_id"=>"8E9E6C50-55C1-4765-812C-4306594E0E3C", "lab_is_id"=>3})
ControlCodeType.find_or_create_by({"description"=>"Urine Cytology Diagnostic", "tps_id"=>"11F987C3-5C82-459C-974A-847A8A221B5C"})
ControlCodeType.find_or_create_by({"description"=>"Pathology Code", "tps_id"=>"27F6BDFD-6663-46B7-B496-A8939E4DD240", "lab_is_id"=>1})
ControlCodeType.find_or_create_by({"description"=>"Image Caption", "tps_id"=>"6151B388-AF0F-40C6-89CE-BFA97ADD2F99", "lab_is_id"=>4})
ControlCodeType.find_or_create_by({"description"=>"Case Comment", "tps_id"=>"4D93B0F9-D6B6-498C-A043-DA52ABB9E130", "lab_is_id"=>5})
ControlCodeType.find_or_create_by({"description"=>"Gross Code", "tps_id"=>"9A2D0E52-EA09-4E2D-9210-F52B35C6318E", "lab_is_id"=>6})