#
# Cookbook Name:: cookbook-simple-ruby-build
# Attribute:: default
#
# Copyright 2013, Naoya Nakazawa
#
# All rights reserved - Do Not Redistribute
#

default['simple-ruby-build']['ruby_version'] = "2.0.0-p247"
default['simple-ruby-build']['aws_region'] = "us-east-1"
default['simple-ruby-build']['aws_s3_bucket'] = "simple-ruby-build"
default['simple-ruby-build']['auto_shutodwn'] = true
