set :stage, :production
set :rails_env, :production
set :branch, "master"

server 'localhost', roles: %w{app web}
