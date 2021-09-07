Object.const_set("PayerPlan", Class.new(ActiveRecord::Base))
PayerPlan.find_or_create_by({"plan_name"=>"test", "active"=>true, "payer_id"=>3})
