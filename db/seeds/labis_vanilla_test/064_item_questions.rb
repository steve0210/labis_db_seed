Object.const_set("ItemQuestion", Class.new(ActiveRecord::Base))
ItemQuestion.find_or_create_by({"questionnaire_type"=>"AdditionalStudyOrder", "question_order"=>1, "question_id"=>1, "category"=>"AdditionalStudyOrder"})
ItemQuestion.find_or_create_by({"questionnaire_type"=>"SpecimenTestType", "question_order"=>2, "question_id"=>2, "category"=>"AdditionalStudyOrder"})
ItemQuestion.find_or_create_by({"questionnaire_id"=>17, "questionnaire_type"=>"SpecimenTestType", "question_order"=>3, "question_id"=>3, "category"=>"AdditionalStudyOrder"})
ItemQuestion.find_or_create_by({"questionnaire_id"=>18, "questionnaire_type"=>"SpecimenTestType", "question_order"=>4, "question_id"=>4, "category"=>"AdditionalStudyOrder"})
ItemQuestion.find_or_create_by({"questionnaire_id"=>18, "questionnaire_type"=>"SpecimenTestType", "question_order"=>3, "question_id"=>3, "category"=>"AdditionalStudyOrder"})
ItemQuestion.find_or_create_by({"questionnaire_id"=>17, "questionnaire_type"=>"SpecimenTestType", "question_order"=>4, "question_id"=>4, "category"=>"AdditionalStudyOrder"})
ItemQuestion.find_or_create_by({"questionnaire_type"=>"AdditionalStudyOrder", "question_order"=>6, "question_id"=>6, "category"=>"AdditionalStudyOrder"})
ItemQuestion.find_or_create_by({"questionnaire_type"=>"AdditionalStudyOrder", "question_order"=>7, "question_id"=>7, "category"=>"AdditionalStudyOrder"})
ItemQuestion.find_or_create_by({"questionnaire_type"=>"AdditionalStudyOrder", "question_order"=>8, "question_id"=>8, "category"=>"AdditionalStudyOrder"})
