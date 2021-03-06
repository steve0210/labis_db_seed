Object.const_set("DxClassification", Class.new(ActiveRecord::Base))
DxClassification.find_or_create_by({"description"=>"Benign", "diagnosis_type"=>"Case"})
DxClassification.find_or_create_by({"description"=>"Suspicious", "diagnosis_type"=>"Case"})
DxClassification.find_or_create_by({"description"=>"Unspecified", "diagnosis_type"=>"Case"})
DxClassification.find_or_create_by({"description"=>"Malignant", "diagnosis_type"=>"Case"})
DxClassification.find_or_create_by({"description"=>"Positive", "diagnosis_type"=>"IHC"})
DxClassification.find_or_create_by({"description"=>"Negative", "diagnosis_type"=>"IHC"})
DxClassification.find_or_create_by({"description"=>"Inconclusive", "diagnosis_type"=>"IHC"})
DxClassification.find_or_create_by({"description"=>"Borderline", "diagnosis_type"=>"IHC"})
