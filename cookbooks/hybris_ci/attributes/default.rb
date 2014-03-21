# jenkins settingst
default['hybris']['jenkins']['install_method'] = "war"
default['hybris']['jenkins']['httpPort'] = "8081"
default['hybris']['jenkins']['jvm_options'] = " -Xmx2G"

default['hybris']['install']['jenkins'] = true
default['hybris']['install']['sonar'] = true
default['hybris']['install']['nexus'] = true

default['hybris']['mysql']['server_root_password'] = "nimda"


default['hybris']['nexus']['port'] = "8082"
default['hybris']['nexus']['context_path'] = "/"

default['hybris']['sonar']['web_port'] = "8083"
