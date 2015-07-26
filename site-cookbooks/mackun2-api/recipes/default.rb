#
# Cookbook Name:: mackun2-api
# Recipe:: default
#
# All rights reserved - Do Not Redistribute

include_recipe "ruby_build"
include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"

# ruby & rbenv
rbenv_ruby "2.2.2"     # rbenv install 2.2.2
rbenv_gem "bundler" do # gem install bundler on rbenv ruby 2.2.2
  ruby_version "2.2.2"
end

# api server repository
git "mackun2-api" do
  repository "git@github.com:takanabe/mackun2-api.git"
  action "sync"
  revision "#{node['rails']['env']}" == "development" ? "development" : "master"
  destination "/home/ec2-user/mackun2-api"
  user "ec2-user"
  group "ec2-user"
end

directory "/home/ec2-user/mackun2-api/.bundle" do
  owner "ec2-user"
  group "ec2-user"
end

file "/home/ec2-user/mackun2-api/.bundle/config" do
  content "---\nBUNDLE_PATH: vendor/bundle\nBUNDLE_DISABLE_SHARED_GEMS: \"1\"\nBUNDLE_WITHOUT: #{node['rails']['env'] == 'development' ? "test" : "development:test"}\n"
  owner "ec2-user"
  group "ec2-user"
end

execute "rbenv & bundler setting" do
  user "ec2-user"
  cwd "/home/ec2-user/mackun2-api"
  environment "PATH" => "/opt/rbenv/bin:#{ENV["PATH"]}"
  timeout 7200
  command "eval \"$(rbenv init -)\" && rbenv local 2.2.2 && bundle install"
end

