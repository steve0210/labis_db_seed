set :stage, :labis_vanilla_test
set :rails_env, :labis_vanilla_test
set :branch, "main"
set :d_enable, false

server "10.208.42.130", user: "rails", roles: %w{app db web}
