#
# Cookbook Name:: SmartOS
# Recipe:: dns
#
# Copyright 2012, Joyent, Inc.
#
# All rights reserved - Do Not Redistribute
#

## Explicitly allow restart of  name service cache after
## updating resolv.conf
##
service "name-service-cache" do
 supports :enable => true, :start => true, :stop => true, :restart => true
 action [ :enable, :start ]
end


## Enable DNS
##
template "/etc/nsswitch.conf" do
 source "nsswitch.conf.erb"
 owner "root"
 group "sys"
 mode '0644'
 not_if "cat /etc/nsswitch.conf | grep ^hosts: | grep \" dns\""
 notifies :restart, resources(:service => "name-service-cache"), :immediate
end

## DNS Resolver
##
template "/etc/resolv.conf" do
 source "resolv.conf.erb"
 owner "root"
 group "sys"
 mode "0644"
 notifies :restart, resources(:service => "name-service-cache"), :immediate
end
