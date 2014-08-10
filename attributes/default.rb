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

case node['platform_family']
when 'freebsd'
  set['openssh']['server']['address_family'] = 'any'
  set['openssh']['server']['allow_agent_forwarding'] = 'yes'
  set['openssh']['server']['allow_tcp_forwarding'] = 'yes'
  set['openssh']['server']['authorized_keys_command'] = 'none'
  set['openssh']['server']['authorized_keys_command_user'] = 'nobody'
  set['openssh']['server']['authorized_keys_file'] = '.ssh/authorized_keys .ssh/authorized_keys2'
  set['openssh']['server']['authorized_principals_file'] = 'none'
  set['openssh']['server']['banner'] = 'none'
  set['openssh']['server']['challenge_response_authentication'] = 'yes'
  set['openssh']['server']['chroot_directory'] = 'none'
  set['openssh']['server']['client_alive_count_max'] = '3'
  set['openssh']['server']['client_alive_interval'] = '0'
  set['openssh']['server']['compression'] = 'delayed'
  set['openssh']['server']['g_s_s_a_p_i_authentication'] = 'no'
  set['openssh']['server']['g_s_s_a_p_i_cleanup_credentials'] = 'yes'
  set['openssh']['server']['gateway_ports'] = 'no'
  set['openssh']['server']['h_p_n_buffer_size'] = '2048'
  set['openssh']['server']['h_p_n_disabled'] = 'no'
  set['openssh']['server']['hostKey'] = [ '/etc/ssh/ssh_host_dsa_key', '/etc/ssh/ssh_host_ecdsa_key', '/etc/ssh/ssh_host_key', '/etc/ssh/ssh_host_rsa_key' ]
  set['openssh']['server']['hostbased_authentication'] = 'no'
  set['openssh']['server']['ignore_rhosts'] = 'yes'
  set['openssh']['server']['ignore_user_known_hosts'] = 'no'
  set['openssh']['server']['kerberos_authentication'] = 'no'
  #set['openssh']['server']['kerberos_get_a_f_s_token'] = 'no' #apparently not supported in freebsd 10.0
  set['openssh']['server']['kerberos_or_local_passwd'] = 'yes'
  set['openssh']['server']['kerberos_ticket_cleanup'] = 'yes'
  set['openssh']['server']['key_regeneration_interval'] = '1h'
  set['openssh']['server']['listen_address'] = [ '0.0.0.0', '::' ]
  set['openssh']['server']['log_level'] = 'INFO'
  set['openssh']['server']['login_grace_time'] = '2m'
  set['openssh']['server']['max_auth_tries'] = '6'
  set['openssh']['server']['max_sessions'] = '10'
  set['openssh']['server']['max_startups'] = '10:30:100'
  #set['openssh']['server']['none_enabled'] = 'no' #apparently not supported in freebsd 10.0
  set['openssh']['server']['password_authentication'] = 'no'
  set['openssh']['server']['permit_empty_passwords'] = 'no'
  set['openssh']['server']['permit_root_login'] = 'no'
  set['openssh']['server']['permit_tunnel'] = 'no'
  set['openssh']['server']['permit_user_environment'] = 'no'
  set['openssh']['server']['pid_file'] = '/var/run/sshd.pid'
  set['openssh']['server']['port'] = '22'
  set['openssh']['server']['print_last_log'] = 'yes'
  set['openssh']['server']['print_motd'] = 'yes'
  set['openssh']['server']['protocol'] = '2'
  set['openssh']['server']['pubkey_authentication'] = 'yes'
  set['openssh']['server']['r_s_a_authentication'] = 'yes'
  set['openssh']['server']['rekey_limit'] = 'default none'
  set['openssh']['server']['rhosts_r_s_a_authentication'] = 'no'
  set['openssh']['server']['server_key_bits'] = '1024'
  set['openssh']['server']['strict_modes'] = 'yes'
  set['openssh']['server']['subsystem'] = 'sftp /usr/libexec/sftp-server'
  set['openssh']['server']['syslog_facility'] = 'AUTH'
  set['openssh']['server']['t_c_p_keep_alive'] = 'yes'
  set['openssh']['server']['tcp_rcv_buf_poll'] = 'yes'
  set['openssh']['server']['use_d_n_s'] = 'yes'
  set['openssh']['server']['use_login'] = 'no'
  set['openssh']['server']['use_p_a_m'] = 'yes'
  set['openssh']['server']['use_privilege_separation'] = 'yes'
  set['openssh']['server']['version_addendum'] = 'FreeBSD-20131111'
  set['openssh']['server']['x11_display_offset'] = '10'
  set['openssh']['server']['x11_forwarding'] = 'yes'
  set['openssh']['server']['x11_use_Localhost'] = 'yes'
end
