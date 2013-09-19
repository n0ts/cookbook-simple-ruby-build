#
# Cookbook Name:: cookbook-simple-ruby-build
# Recipe:: rbenv_dir
#
# Copyright 2013, Naoya Nakazawa
#
# All rights reserved - Do Not Redistribute
#

directory node["rbenv"]["install_prefix"] do
  owner node["rbenv"]["user"]
  group node["rbenv"]["group"]
  mode 0755
  action :create
end
