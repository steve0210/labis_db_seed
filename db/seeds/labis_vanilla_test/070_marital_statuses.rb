Object.const_set("MaritalStatus", Class.new(ApplicationRecord))
MaritalStatus.find_or_create_by({"description"=>"Single"})
MaritalStatus.find_or_create_by({"description"=>"Married"})
MaritalStatus.find_or_create_by({"description"=>"Separated"})
MaritalStatus.find_or_create_by({"description"=>"Divorced"})
MaritalStatus.find_or_create_by({"description"=>"Widowed"})