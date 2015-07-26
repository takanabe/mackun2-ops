#
# Cookbook Name:: mackun2-users
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
data_ids = data_bag('users')

data_ids.each do |id|
  u = data_bag_item('users', id)

  user u['id'] do
    shell    u['shell']
    supports :manage_home => true, :non_unique => false
    home "/home/#{u['id']}"
    action   [:create]
  end

  directory "/home/#{id}/.ssh" do
    owner u['id']
    group u['id']
    mode 0700
    action :create
  end

  case node[:platform]
  when "centos", "redhat"
    group 'wheel' do
      action [:modify]
      members u['id']
      append true
    end
  when "ubuntu"
    group 'admin' do
      action [:modify]
      members u['id']
      append true
    end
  end

  case node[:platform]
  when "centos", "redhat"
    execute "delete-user-password" do
      command "passwd -d ec2-user"
      action :run
    end
  when "ubuntu"
    execute "delete-user-password" do
      command "passwd -d ec2-user"
      action :run
    end
  end

end
