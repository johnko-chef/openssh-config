name             'openssh-config'
maintainer       'John Ko'
maintainer_email 'git@johnko.ca'
license          'Apache 2.0'
description      'Configures openssh'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.0'

recipe           'openssh-config', 'Configures openssh'
depends          'openssh'
depends          'sysrc'
depends          'svc'

%w(freebsd).each do |os|
  supports os
end
