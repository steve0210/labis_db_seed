Object.const_set("ClientAccountPhysician", Class.new(ApplicationRecord))
ClientAccountPhysician.find_or_create_by({"first_name"=>"Test", "last_name"=>"Physician", "credentials"=>"MD", "tps_id"=>"c8c0fc91-9e04-4f64-9355-fb6436f14350", "active"=>true, "account_id"=>1})
ClientAccountPhysician.find_or_create_by({"first_name"=>"Test", "last_name"=>"Test", "credentials"=>"MD", "active"=>true, "account_id"=>1})
ClientAccountPhysician.find_or_create_by({"first_name"=>"TEST", "last_name"=>"TEST", "credentials"=>"DR", "active"=>true, "account_id"=>25})
ClientAccountPhysician.find_or_create_by({"first_name"=>"Gerald", "last_name"=>"Bertiger", "credentials"=>"MD", "specialty_id"=>56, "active"=>true, "account_id"=>25})
ClientAccountPhysician.find_or_create_by({"first_name"=>"Physician", "last_name"=>"ProficiencyTest", "credentials"=>"MD", "upin"=>"X00000", "specialty_id"=>58, "tps_id"=>"4ac344e5-e3a9-4141-bec9-a2edf70f4147", "active"=>true, "account_id"=>48})
ClientAccountPhysician.find_or_create_by({"first_name"=>"Michael", "last_name"=>"Goldstein", "middle_initial"=>"J", "credentials"=>"MD", "npi"=>"1063410645", "upin"=>"C10810", "specialty_id"=>56, "active"=>true, "account_id"=>50})
ClientAccountPhysician.find_or_create_by({"first_name"=>"Ira", "last_name"=>"Goldman", "middle_initial"=>"S", "credentials"=>"MD", "npi"=>"1992703508", "upin"=>"A48734", "specialty_id"=>56, "active"=>true, "account_id"=>50})
ClientAccountPhysician.find_or_create_by({"first_name"=>"Benita", "last_name"=>"Ponda", "middle_initial"=>"P", "credentials"=>"MD", "npi"=>"1215093349", "specialty_id"=>29, "active"=>true, "account_id"=>50})
ClientAccountPhysician.find_or_create_by({"first_name"=>"Haleh", "last_name"=>"Pazwash", "credentials"=>"MD", "npi"=>"1902856099", "upin"=>"H93192", "specialty_id"=>56, "active"=>true, "account_id"=>67})
ClientAccountPhysician.find_or_create_by({"first_name"=>"Mitchell", "last_name"=>"Rubinoff", "middle_initial"=>"J", "credentials"=>"MD", "npi"=>"1942250345", "upin"=>"B14391", "specialty_id"=>56, "active"=>true, "account_id"=>67})
ClientAccountPhysician.find_or_create_by({"first_name"=>"Michael", "last_name"=>"Rahmin", "middle_initial"=>"G", "credentials"=>"MD", "npi"=>"1902856313", "upin"=>"F24536", "specialty_id"=>56, "active"=>true, "account_id"=>67})
ClientAccountPhysician.find_or_create_by({"first_name"=>"Zvi", "last_name"=>"Fischer", "middle_initial"=>"H", "credentials"=>"MD", "npi"=>"1437108339", "upin"=>"C56309", "specialty_id"=>56, "active"=>true, "account_id"=>67})
ClientAccountPhysician.find_or_create_by({"first_name"=>"TEST", "last_name"=>"Physician", "credentials"=>"MD", "active"=>true, "account_id"=>42})
ClientAccountPhysician.find_or_create_by({"first_name"=>"Jay", "last_name"=>"Babich", "middle_initial"=>"P", "credentials"=>"MD", "npi"=>"1275862732", "specialty_id"=>56, "active"=>true, "account_id"=>67})
ClientAccountPhysician.find_or_create_by({"first_name"=>"Pyhsician", "last_name"=>"Test", "credentials"=>"MD", "specialty_id"=>4, "tps_id"=>"4ac344e5-e3a9-4141-bec9-a2edf70f4147", "active"=>true, "account_id"=>48})
ClientAccountPhysician.find_or_create_by({"first_name"=>"Physician", "last_name"=>"Test", "credentials"=>"MD", "specialty_id"=>4, "active"=>true, "account_id"=>48})
ClientAccountPhysician.find_or_create_by({"first_name"=>"Doctor", "last_name"=>"Testing", "credentials"=>"Md", "specialty_id"=>45, "active"=>true, "account_id"=>48})
ClientAccountPhysician.find_or_create_by({"first_name"=>"Test", "last_name"=>"Gastro", "credentials"=>"MD", "specialty_id"=>56, "active"=>true, "account_id"=>48})
ClientAccountPhysician.find_or_create_by({"first_name"=>"Doc", "last_name"=>"Gasroenterology", "credentials"=>"MD", "npi"=>"1232434564", "specialty_id"=>56, "active"=>true, "account_id"=>48})
ClientAccountPhysician.find_or_create_by({"first_name"=>"San", "last_name"=>"Good", "credentials"=>"Md", "specialty_id"=>29, "active"=>true, "account_id"=>48})
ClientAccountPhysician.find_or_create_by({"first_name"=>"Xuan", "last_name"=>"Wang", "credentials"=>"M.D.", "specialty_id"=>41, "active"=>true, "account_id"=>109})
ClientAccountPhysician.find_or_create_by({"first_name"=>"Fake", "last_name"=>"Smith", "credentials"=>"M.D.", "active"=>true, "account_id"=>109})
ClientAccountPhysician.find_or_create_by({"first_name"=>"Physician", "last_name"=>"Test", "credentials"=>"MD", "specialty_id"=>45, "active"=>true, "account_id"=>48})
ClientAccountPhysician.find_or_create_by({"first_name"=>"Breast", "last_name"=>"Physician", "credentials"=>"Md", "specialty_id"=>46, "active"=>true, "account_id"=>48})
ClientAccountPhysician.find_or_create_by({"first_name"=>"IT Demo", "last_name"=>"Test Physician", "credentials"=>"MD", "active"=>true, "account_id"=>111})