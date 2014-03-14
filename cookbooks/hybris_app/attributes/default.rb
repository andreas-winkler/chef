#hybris definition
default['hybris']['installRootPath'] = "/opt/hybris"
default['hybris']['installPathPrefix'] = "hybris"
default['hybris']['dataSubFolder'] = "data"
default['hybris']['configSubFolder'] = "config"
default['hybris']['backupSubFolder'] = "backup"
default['hybris']['numberOfPreviousReleases'] = 3

#default['hybris']['artefactBaseUrl'] = "http://buildServer/jobs/hybris"
default['hybris']['artefactBaseUrl'] = "http://10.74.2.40/"
default['hybris']['artefactName'] = "hybris.zip"
default['hybris']['deleteArtefactAfterExtract'] = true

default['hybris']['version'] = "5.1"
default['hybris']['buildNumber'] = 1
default['hybris']['deployNumber'] = 0
default['hybris']['buildOnTargetSystem'] = true



default['hybris']['clusterID'] = nil

