Object.const_set("Payer", Class.new(ActiveRecord::Base))
Payer.find_or_create_by({"company_name"=>"Blue Cross Blue Shield", "street_address"=>"111 Main St", "address_2"=>"11", "city"=>"New York", "state"=>"NY", "zip"=>"88888", "active"=>true, "insurance_code"=>"BCBS", "company_phone"=>"2223334444", "account_id"=>1})
Payer.find_or_create_by({"company_name"=>"Cigna", "street_address"=>"PO Box 5200", "city"=>"Scranton", "state"=>"PA", "zip"=>"18505", "active"=>true, "insurance_code"=>"cigna", "account_id"=>80})
Payer.find_or_create_by({"company_name"=>"Test", "street_address"=>"Test", "city"=>"Test", "state"=>"AL", "zip"=>"12345", "active"=>true, "insurance_code"=>"test", "account_id"=>48})
