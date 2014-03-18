name             'hybris_ci'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures hybris_ci'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'


depends "hybris_base"
depends "jenkins"
depends "sonar"
depends "mysql"
