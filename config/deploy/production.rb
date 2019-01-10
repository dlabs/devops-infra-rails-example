
# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

set :stage, :production
set :rails_env, :production
set :branch, "master"

server "18.196.183.164", user: "ubuntu"
