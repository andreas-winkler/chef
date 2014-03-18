# x86_64
default['hybris']['java']['jdk']['7']['x86_64']['url'] = 'http://download.oracle.com/otn-pub/java/jdk/7u45-b18/jdk-7u45-linux-x64.tar.gz'
default['hybris']['java']['jdk']['7']['x86_64']['checksum'] = 'f2eae4d81c69dfa79d02466d1cb34db2b628815731ffc36e9b98f96f46f94b1a'

# for update 51 use the following settings
#default['hybris']['java']['jdk']['7']['x86_64']['url'] = 'http://download.oracle.com/otn-pub/java/jdk/7u51-b13/jdk-7u51-linux-x64.tar.gz'
#default['hybris']['java']['jdk']['7']['x86_64']['checksum'] = '77367c3ef36e0930bf3089fb41824f4b8cf55dcc8f43cce0868f7687a474f55c'

default['hybris']['java']['jdk_version'] = '7'
default['hybris']['java']['java_home'] = "/usr/lib/jvm/java"

default['hybris']['java']['install_flavor'] = "oracle"
default['hybris']['java']['oracle']['accept_oracle_download_terms'] = "true"
