set :stage, :labis_test
set :rails_env, :labis_test
set :branch, "main"
set :d_enable, false

server "10.212.148.50", user: "rails", roles: %w{app db web}
