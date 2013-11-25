#
# Cookbook Name:: cookbook-simple-ruby-build
# Recipe:: default
#
# Copyright 2013, Naoya Nakazawa
#
# All rights reserved - Do Not Redistribute
#

#
# Ruby build
#
rbenv_ruby node["simple-ruby-build"]["ruby_version"] do
  global true
end

rbenv_gem "bundler" do
  ruby_version node["simple-ruby-build"]["ruby_version"]
end


#
# AWS tools
#
case node[:platform]
when 'ubuntu'
  apt_repository "aws" do
    uri "http://ap-northeast-1.ec2.archive.ubuntu.com/ubuntu/"
    distribution "saucy"
    components [ "multiverse" ]
    deb_src false
    action :add
  end

  package "ec2-api-tools" do
    action [:install, :upgrade]
  end
end

python_pip "awscli"


#
# Sync rbenv directory to S3 (overwrite)
#
package "pigz"

bash "sync-to-s3" do
  user node[:rbenv][:user]
  group node[:rbenv][:group]
  cwd node[:rbenv][:install_prefix]
  environment ({ "AWS_DEFAULT_REGION" => node["simple-ruby-build"]["aws_region"] })
  code <<-EOH
tar cf /tmp/rbenv-#{node["simple-ruby-build"]["ruby_version"]}.tar.gz \
  --use-compress-prog=pigz ./rbenv
aws s3 cp \
    /tmp/rbenv-#{node["simple-ruby-build"]["ruby_version"]}.tar.gz \
    s3://#{node["simple-ruby-build"]["aws_s3_bucket"]}/
EOH
  not_if { ::File.exists?("/tmp/rbenv-#{node["simple-ruby-build"]["ruby_version"]}.tar.gz") }
end


#
# Shutdown VM
#
bash "shutdown-vm" do
  user "root"
  group "root"
  code <<-EOH
  poweroff
EOH
  only_if { node['simple-ruby-build']['auto_shutodwn'] }
end
