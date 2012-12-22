#
# Cookbook Name:: SmartOS
# Recipe:: hostname
#
# Copyright 2012, Joyent, Inc.
#
# All rights reserved - Do Not Redistribute
#
nodename = Chef::Config[:node_name]
execute "Set hostname to #{nodename}" do
  command "/usr/bin/hostname #{nodename} && /usr/bin/hostname > /etc/nodename"
  not_if "grep #{nodename} /etc/nodename"
end
