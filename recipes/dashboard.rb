#
# Cookbook Name:: centos-cloud
# Recipe:: dashboard
#
# Copyright 2013, cloudtechlab
#
# All rights reserved - Do Not Redistribute
#

include_recipe "libcloud"
include_recipe "selinux::disabled"
include_recipe "centos_cloud::repos"
include_recipe "centos_cloud::iptables-policy"

%w[
mod_wsgi httpd mod_ssl openstack-dashboard
memcached python-memcached
].each do |pkg|
  package pkg do
    action :install
  end
end

simple_iptables_rule "dashboard" do
  rule "-p tcp -m multiport --dports 80,443"
  jump "ACCEPT"
end

service "httpd" do
  action [:enable, :start]
end

