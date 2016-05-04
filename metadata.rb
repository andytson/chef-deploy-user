name              'deploy-user'
maintainer        'Inviqa'
maintainer_email  'athompson@inviqa.com'
issues_url        'https://github.com/andytson/chef-deploy-user/issues'
source_url        'https://github.com/andytson/chef-deploy-user'
license           'Apache 2.0'
description       'Creates a deploy user for capistrano using data bags'
version           '0.1.0'

depends 'ssh_known_hosts', '>= 2.0'

%w( debian ubuntu centos redhat fedora scientific amazon windows ).each do |os|
  supports os
end
