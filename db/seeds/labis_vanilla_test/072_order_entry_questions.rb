Object.const_set("OrderEntryQuestion", Class.new(ApplicationRecord))
OrderEntryQuestion.find_or_create_by({"case_type_id"=>24, "account_id"=>109, "answer_type"=>"string", "question_text"=>"clinical history", "required"=>true, "active"=>true, "sort_order"=>1})
OrderEntryQuestion.find_or_create_by({"account_id"=>109, "answer_type"=>"string", "question_text"=>"clinical history", "required"=>true, "active"=>true, "sort_order"=>1})
OrderEntryQuestion.find_or_create_by({"account_id"=>48, "answer_type"=>"string", "question_text"=>"Clinical HX", "active"=>true, "sort_order"=>2, "clinical_observation_identifier"=>"CHX"})
