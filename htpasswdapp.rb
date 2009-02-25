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

get '/:encryption/:password' do
  @encoder.encode(params[:encryption], params[:password])
end

get '/:encryption/:user/:password' do
  user, password = params[:user], @encoder.encode(params[:encryption], params[:password])
  "#{user}:#{password}\n"
end

