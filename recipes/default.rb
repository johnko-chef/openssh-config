#
# Cookbook Name:: sshd-config
# Recipe:: default
#
# Author:: John Ko <git@johnko.ca>
# Copyright 2014, John Ko
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "openssh"
include_recipe "sysrc"
include_recipe "svc"

if platform?("freebsd")

  # Prevent service ssh from running from openssh recipe

  begin
    r1 = resources(:service => "ssh")
    r1.action :nothing
  rescue Chef::Exceptions::ResourceNotFound
    Chef::Log.warn "could not find template to override!"
  end

  # Disable use of old rsav1 and dsa

  %w(sshd_rsa1_enable sshd_dsa_enable).each do |k|
    sysrc k do
      value 'NO'
      file '/etc/rc.conf'
    end
  end

  # Enable and start service with svc library

  svc 'sshd' do
    service_name node['openssh']['service_name']
    supports value_for_platform(
      'freebsd' => { 'default' => [:restart, :reload, :status] }
    )
    action [ :enable, :start ]
  end

  # Try to run test-sshd-config, and restart with svc library

  execute "sshd-configtest" do
    command "service sshd oneconfigtest"
    notifies :reload, 'svc[sshd]'
  end

end
