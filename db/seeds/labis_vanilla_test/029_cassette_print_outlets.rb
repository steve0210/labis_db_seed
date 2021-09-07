Object.const_set("CassettePrintOutlet", Class.new(ActiveRecord::Base))
CassettePrintOutlet.find_or_create_by({"description"=>"Outlet 1"})
CassettePrintOutlet.find_or_create_by({"description"=>"Outlet 2"})
CassettePrintOutlet.find_or_create_by({"description"=>"Outlet 3"})
