#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

if node['platform_family'] == "rhel"
        package = "httpd"
elsif node['platform_family'] == "debian"
        package = "apache2"
end
package 'apache2' do
        package_name package
        action :install
end
if node['platform_family'] == "rhel"
        service = "httpd"
elsif node['platform_family'] == "debian"
        service = "apache2"
end
service 'apache' do
        service_name service
        action [:enable, :start]
end
include_recipe 'apache::website'
