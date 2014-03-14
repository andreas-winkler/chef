# provider to start 

action :set do
  
  propertyFilename = "#{new_resource.propertyFile}"
  
  if new_resource.propertyFile.nil? or new_resource.propertyKey.nil?
    Chef::Log.warn("appServer directory or propertyValue not given.")
  else
    ruby_block "change properties file" do
      block do

        contents = ""

        if ::File.exists?(propertyFilename)
          inputFile = ::File.open(propertyFilename)
          valueFound = false
          
          #read file line by line
          inputFile.each { |line|
            #split key value pairs
            keyValue = line.split("=", 2)
            
            #is key the right one?
            if !keyValue[0].nil? && new_resource.propertyKey.eql?(keyValue[0].strip)
              valueFound = true
              #check is value different from value to set
              if !keyValue[1].nil? && !keyValue[1].strip.eql?(new_resource.propertyValue)
                contents << "#changed " + Time.now.to_s + "  " + line
                contents << new_resource.propertyKey + "=" + new_resource.propertyValue + "\n"
              else
                #just add unchanged content
                contents << line
              end
            else  
              #just add unchanged content
              contents << line
            end
          }
            
          #if key not found, add key at the end of the file
          if !valueFound
              contents << new_resource.propertyKey + "=" + new_resource.propertyValue + "\n"
          end 

          inputFile.close

          #create backup of file
          if new_resource.createBackup == true
            if ::File.exists?(propertyFilename)
              ::File.rename(propertyFilename, "#{propertyFilename}.bak")
            end
          end

        end

        #write changed file
        outputFile = ::File.open(propertyFilename, "w")
        outputFile.write(contents)
        outputFile.close

      end
    end
  end    
end

action :read do
    ruby_block "read key from properties file" do
      block do

        node.set['hybris']['readedValue'] = nil

        if ::File.exists?(new_resource.propertyFile)
          inputFile = ::File.open(new_resource.propertyFile)
          valueFound = false
          
          #read file line by line
          inputFile.each { |line|
            #split key value pairs
            keyValue = line.split("=", 2)
            
            #is key the right one?
            if !keyValue[0].nil? && new_resource.propertyKey.eql?(keyValue[0].strip) && !keyValue[1].nil?
              node.set['hybris']['readedValue'] = keyValue[1].strip
              puts "++#{node['hybris']['readedValue']}++"
            end
          }

          inputFile.close
        end
      end
    end
end
