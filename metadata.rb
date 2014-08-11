name             'sshd-config'
maintainer       'John Ko'
maintainer_email 'git@johnko.ca'
license          'Apache 2.0'
description      'Creates a sshd_config'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

recipe           'sshd-config', 'Creates a sshd_config'
depends          'openssh'
depends          'sysrc'
depends          'svc'

%w(freebsd).each do |os|
  supports os
end
