Object.const_set("IhcSpecimenType", Class.new(ApplicationRecord))
IhcSpecimenType.find_or_create_by({"description"=>"Tissue"})
IhcSpecimenType.find_or_create_by({"description"=>"FNA"})
IhcSpecimenType.find_or_create_by({"description"=>"Smear"})
IhcSpecimenType.find_or_create_by({"description"=>"Touch Imprint"})
IhcSpecimenType.find_or_create_by({"description"=>"Other"})