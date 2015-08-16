role :app, %w{perfectter}
role :web, %w{perfectter}
role :db,  %w{perfectter}

set :stage, :production
set :rails_env, :production

set :deploy_to, '/home/ec2-user/perfectter'

set :default_env, {
  rbenv_root: "/home/ec2-user/.rbenv",
  path: "/home/ec2-user/.rbenv/shims:/home/ec2-user/.rbenv/bin:$PATH",
}
