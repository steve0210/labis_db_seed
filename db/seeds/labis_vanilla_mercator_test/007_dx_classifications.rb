Object.const_set("DxClassification", Class.new(ActiveRecord::Base))
DxClassification.find_or_create_by({"description"=>"Atypia", "tps_id"=>"06190D56-3995-4BB4-AEC9-B1C3C1AC39D4", "lab_is_id"=>3})
DxClassification.find_or_create_by({"description"=>"Benign", "tps_id"=>"20F71517-8FBA-4D4B-B270-DD1BE857FE7C", "lab_is_id"=>1})
DxClassification.find_or_create_by({"description"=>"Deferred", "tps_id"=>"2EB6B2AA-881F-4D11-AB06-B58B55DB340E", "lab_is_id"=>3})
DxClassification.find_or_create_by({"description"=>"Malignant", "tps_id"=>"B765C5BC-45FF-4696-8B6D-7303F4E06BEA", "lab_is_id"=>4})
DxClassification.find_or_create_by({"description"=>"Other", "tps_id"=>"AEA5E7F3-0854-4A9D-95AF-086B3105BF60", "lab_is_id"=>3})
DxClassification.find_or_create_by({"description"=>"Significant", "tps_id"=>"13092798-A8E2-4D8D-BAD8-A4DD59EFDDDB", "lab_is_id"=>3})
DxClassification.find_or_create_by({"description"=>"Suspicious", "tps_id"=>"45653E27-BF73-418A-804C-CD26F2F33D13", "lab_is_id"=>2})
DxClassification.find_or_create_by({"description"=>"Unspecified", "tps_id"=>"53275B9F-BD8C-4309-AC61-48B0472BE782", "lab_is_id"=>3})