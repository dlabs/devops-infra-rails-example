set :stage, :local
set :rails_env, :production
set :branch, "master"

server 'localhost', user: 'ubuntu', roles: %w{app web}
