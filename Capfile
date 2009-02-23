load 'deploy' if respond_to?(:namespace) # cap2 differentiator
#Dir['vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }
#load 'config/deploy'
set :application, "htpasswdapp"
set :domain,      "htpasswdapp.com"
set :deploy_to,   ""

set :scm, :git
set :repository, ""

server domain, :web, :app

namespace :deploy do
  task :restart do

  end
end
