Object.const_set("WorkStationType", Class.new(ActiveRecord::Base))
WorkStationType.find_or_create_by({"description"=>"Embedding"})
WorkStationType.find_or_create_by({"description"=>"Microtomy"})
