#
# Cookbook Name:: SmartOS
# Recipe:: var
#
# Copyright 2012, Joyent, Inc.
#
# All rights reserved - Do Not Redistribute
#

## Enable atime on /var, so that WTMPX and logs work properly
##
execute "Enable atime for /var" do
  command "/usr/sbin/zfs set atime=on zones/var"
  only_if "/usr/sbin/zfs get -Hp atime zones/var | grep off"
end
