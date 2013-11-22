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
include_recipe "centos_cloud::swift-proxy"
include_recipe "centos_cloud::glance"
include_recipe "centos_cloud::cinder"
include_recipe "centos_cloud::neutron"
include_recipe "centos_cloud::nova"
include_recipe "centos_cloud::nova-compute-kvm"
include_recipe "centos_cloud::swift-node"
include_recipe "centos_cloud::heat"
include_recipe "centos_cloud::ceilometer"
include_recipe "centos_cloud::dashboard"
