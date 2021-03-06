Object.const_set("CytologyDifferential", Class.new(ActiveRecord::Base))
CytologyDifferential.find_or_create_by({"name"=>"Blasts", "order"=>1, "active"=>true, "range_low"=>0, "range_high"=>3})
CytologyDifferential.find_or_create_by({"name"=>"Promyelocytes", "order"=>2, "active"=>true, "range_low"=>0, "range_high"=>8})
CytologyDifferential.find_or_create_by({"name"=>"Neutrophils/Maturing myeloids", "order"=>3, "active"=>true, "range_low"=>50, "range_high"=>70})
CytologyDifferential.find_or_create_by({"name"=>"Monocytes", "order"=>4, "active"=>true, "range_low"=>0, "range_high"=>6})
CytologyDifferential.find_or_create_by({"name"=>"Eosinophils", "order"=>5, "active"=>true, "range_low"=>1, "range_high"=>5})
CytologyDifferential.find_or_create_by({"name"=>"Basophils", "order"=>6, "active"=>true, "range_low"=>0, "range_high"=>2})
CytologyDifferential.find_or_create_by({"name"=>"Lymphocytes", "order"=>7, "active"=>true, "range_low"=>3, "range_high"=>15})
CytologyDifferential.find_or_create_by({"name"=>"Plasma Cells", "order"=>8, "active"=>true, "range_low"=>0, "range_high"=>4})
CytologyDifferential.find_or_create_by({"name"=>"Erythroid precursors", "order"=>9, "active"=>true, "range_low"=>20, "range_high"=>25})
