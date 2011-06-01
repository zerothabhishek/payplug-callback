require 'rubygems'
require 'sinatra'
require 'sinatra/sequel'
require 'erb'
require 'yaml'
require File.expand_path('../database', __FILE__)

post '/payplug/paypal' do 
  Notification.insert(:params=>params.to_yaml, :created_at=>DateTime.now, :gateway => "paypal")
end

post '/payplug/google' do
  Notification.insert(:params=>params.to_yaml, :created_at=>DateTime.now, :gateway => "google")
end

# Display all the callbacks received from various services
get '/payplug' do 
  @notifications = Notification.all
  erb :index
end
