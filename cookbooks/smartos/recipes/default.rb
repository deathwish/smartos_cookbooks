#
# Cookbook Name:: SmartOS
# Recipe:: default
#
# Copyright 2012, Joyent, Inc.
#
# All rights reserved - Do Not Redistribute
#

## Setup DNS
##
include_recipe "smartos::dns"

## Set the Hostname
##
include_recipe "smartos::hostname"

## Enable atime on /var
##
include_recipe "smartos::var"

##  Setup SSH for the Root User
##
if node.attribute?("ssh")
  include_recipe "smartos::ssh"
end

## Install 'nicstat'
##
include_recipe "smartos::nicstat"

## Configure NTP
##
include_recipe "smartos::ntp"

## Write the motd
##
include_recipe "smartos::motd"
