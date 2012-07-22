set :application, "EventManagementApp"
set :repository,  "https://github.com/jonnylynchy/EventManagementApp.git"

set :scm, :git

set :user, 'deploy'
set :use_sudo, false
set :deploy_to, "/home/deploy/sites/#{application}"
#set :deploy_via, :remote_cache
set :deploy_via, :remote_cache   # copy code over to server, no need to configure scm on the server
ssh_options[:forward_agent] = true
ssh_options[:keys] = ["~/ssh/myPrivateKey.key"]

role :web, "flux-orion.cloudapp.net"                          # Your HTTP server, Apache/etc
role :app, "flux-orion.cloudapp.net"                          # This may be the same as your `Web` server
role :db,  "flux-orion.cloudapp.net", :primary => true # This is where Rails migrations will run

after "deploy:update_code", "preconfigure"
desc "Configure the application with correct database and precompile assets"
task :preconfigure, :roles => :app do
  # bundle gems
  run "mkdir -p #{shared_path}/bundle && ln -s #{shared_path}/bundle #{release_path}/vendor/bundle"
  run "cd #{latest_release}; bundle install --deployment --without development test"
  run "rake assets:precompile"
  # symlink database.yml: copy if not exists, then link it back (release/config/database.yml -> shared/database.yml)
  run "cp -n #{release_path}/config/database.yml #{shared_path}"
  run "ln -sf #{shared_path}/database.yml #{release_path}/config/database.yml"

  # Compile SCSS
  #run "cd #{latest_release}; bundle exec compass compile #{release_path}"

  # and also prepare nginx.conf
  config_content = from_template("config/nginx.conf.erb")
  put config_content, "#{release_path}/nginx.conf"
end

def get_binding
  binding # So that everything can be used in templates generated for the servers
end

def from_template(file)
  require 'erb'
  template = File.read(File.join(File.dirname(__FILE__), "..", file))
  result = ERB.new(template).result(self.get_binding)
end

namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
end

after "deploy", "deploy:cleanup" # leave only 5 releases


# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do

#   namespace :assets do
#     task :precompile, :roles => :web, :except => { :no_release => true } do
#       from = source.next_revision(current_revision)
#       if capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ | wc -l").to_i > 0
#         run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
#       else
#         logger.info "Skipping asset pre-compilation because there were no asset changes"
#       end
#     end
#   end

#   task :bundle_gems do
#     sleep 5
#     run "cd #{latest_release}"
#     run "rake assets:precompile"
#     #run "bundle install --path vendor/bundle"
#     run "bundle install --deployment"
#     #run "bundle install"
#   end
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     #run "touch #{File.join(current_path,'tmp','restart.txt')}"
#     # For NginX
#   end
# end