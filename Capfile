load 'deploy' if respond_to?(:namespace) # cap2 differentiator
#Dir['vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }
#load 'config/deploy'
set :application,   "htpasswdapp"
set :domain,        "htpasswdapp.com"
set :deploy_to,     "/data/#{application}"
set :keep_releases, 5
set :user,          "admin"

ssh_options[:paranoid] = false

set :scm, :git
set :repository, "git@github.com:jpease/htpasswdapp.git"

server domain, :web, :app

namespace :deploy do
  task :restart do
    sudo `monit restart all -g htpasswdapp`
  end

  task :set_executable, :roles => :app do
    sudo `chmod +x /data/htpasswdapp/current/script/monit_sinatra`
  end
end

after "deploy:symlink_configs", "deploy:set_executable"
