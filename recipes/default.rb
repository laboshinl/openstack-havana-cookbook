#
# Cookbook Name:: centos-cloud
# Recipe:: default
#
# Copyright 2013, cloudtechlab
#
# All rights reserved - Do Not Redistribute
#

include_recipe "centos_cloud::qpid"
include_recipe "centos_cloud::keystone"
include_recipe "centos_cloud::glance"
include_recipe "centos_cloud::cinder"
include_recipe "centos_cloud::neutron"
include_recipe "centos_cloud::nova"
include_recipe "centos_cloud::nova-compute-esxi"
include_recipe "centos_cloud::dashboard"
