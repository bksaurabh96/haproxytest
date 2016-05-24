#
# Cookbook Name:: haproxy
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'haproxy'
include_recipe 'rsyslog'

#Enable haproxy logs file
cookbook_file "/etc/rsyslog.d/haproxy.conf" do
  source "haproxy.conf"
  owner "root"
  group "root"
  mode 00644
end

#Restart rsyslog service to enable logging
service node['rsyslog']['service_name'] do
  supports restart: true, status: true
  action [:enable, :start]
end