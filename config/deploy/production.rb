require 'aws-sdk-ec2'

set :stage, :production
set :rails_env, :production
set :branch, "master"

ec2 = Aws::EC2::Resource.new(region: 'eu-central-1', profile: 'dlabs')
instances = ec2.instances({
  filters: [
    { name: 'tag:Organization', values: ['dlabs']},
    { name: 'tag:Project', values: ['main']},
    { name: 'tag:Environment', values: ['test']},
    { name: 'instance-state-name', values: ['running']}
  ]
  }
)

if instances.count.zero?
  abort("No running instances found on aws. Check capistrano configuration in config/deploy/.")
end

instances.each do |i|
  server "#{i.public_ip_address}", user: "ubuntu"
end
