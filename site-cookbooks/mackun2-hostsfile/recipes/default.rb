#
# Cookbook Name:: mackun2-hostsfile
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# include_recipe 'hostsfile'

hostsfile_entry '127.0.0.1' do
  hostname  'localhost'
  aliases   ['local.mackun2', 'local.mackun2-api', 'local.mackun2-web']
  action    :create
end
