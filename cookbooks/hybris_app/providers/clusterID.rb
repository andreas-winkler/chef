# provider to start 

clusterIDKey = "cluster.id"

action :set do
  if new_resource.appServerDirectory.nil? or new_resource.clusterID.nil?
    Chef::Log.warn("appServer directory or clusterID not given.")
  else
    ruby_block "change properties file" do
      block do
        if ::File.exists?("#{new_resource.appServerDirectory}/config/local.properties")
          inputFile = ::File.open("#{new_resource.appServerDirectory}/config/local.properties")
          contents = ""
          valueFound = false
          inputFile.each { |line|
            keyValue = line.split("=", 2)
            if !keyValue[0].nil? && clusterIDKey.eql?(keyValue[0].strip)
              valueFound = true
              if !keyValue[1].nil? && keyValue[1].strip.eql?(new_resource.clusterID)
                contents << "#changed " + line
                contents << clusterIDKey + "=" + new_resource.clusterID + "\n"
              end
            else  
              contents << line
            end
            }
            
          if !valueFound
              contents << clusterIDKey + "=" + new_resource.clusterID + "\n"
          end 

          inputFile.close

          if new_resource.createBackup == true
            if ::File.exists?("#{new_resource.appServerDirectory}/config/local.properties")
              ::File.rename("#{new_resource.appServerDirectory}/config/local.properties", "#{new_resource.appServerDirectory}/config/local.properties.bak")
            end
          end

          outputFile = ::File.open("#{new_resource.appServerDirectory}/config/local.properties", "w")
          outputFile.write(contents)
          outputFile.close
        end
      end
    end
  end    
end
