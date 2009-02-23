$LOAD_PATH << File.join(Dir.getwd, 'lib')
require 'rubygems'
require 'sinatra'
require 'encoder'

before do
  @encoder = Encoder.new
end

get '/' do
  erb :home
end

get '/encode/:password' do
  @encoder.encode(params[:password])
end

get '/encode/:user/:password' do
  user, password = params[:user], @encoder.encode(params[:password])
  "#{user}:#{password}\n"
end
