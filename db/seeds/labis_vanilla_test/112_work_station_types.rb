Object.const_set("WorkStationType", Class.new(ApplicationRecord))
WorkStationType.find_or_create_by({"description"=>"Embedding"})
WorkStationType.find_or_create_by({"description"=>"Microtomy"})
