#
# Cookbook Name:: mackun2-local
# Recipe:: default

mysql_client 'default' do
    action :create
end

mysql_service 'default' do
  version '5.6'
  port '3306'
  initial_root_password ''
  action [:create, :start]
end


