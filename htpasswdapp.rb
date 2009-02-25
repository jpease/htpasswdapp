$LOAD_PATH << File.join(Dir.getwd, 'lib')
require 'rubygems'
require 'sinatra'
require 'encoder'

File.open("tmp/pids/htpasswdapp_#{Sinatra::Application.port}.pid", 'w') { |f| f.write(Process.pid) }

before do
  @encoder = Encoder.new
end

get '/' do
  erb :home
end

get '/crypt/:password' do
  @encoder.crypt(params[:password])
end

get '/crypt/:user/:password' do
  user, password = params[:user], @encoder.crypt(params[:password])
  "#{user}:#{password}\n"
end
