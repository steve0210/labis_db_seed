Object.const_set("List", Class.new(ApplicationRecord))
List.find_or_create_by({"name"=>"Bethesda"})
List.find_or_create_by({"name"=>"Specimen Adequacy"})
List.find_or_create_by({"name"=>"Retrospective Findings"})
