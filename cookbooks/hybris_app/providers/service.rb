# provider to start 

action :start do
  if new_resource.appServerDirectory
    
    mode = "start"
    if !new_resource.mode.nil?
      mode = new_resource.mode
     end
     
     execute "start hybris server" do 
        command "nohup #{new_resource.appServerDirectory}/bin/platform/hybrisserver.sh #{new_resource.mode} > /dev/null 2>&1 &"
        action :run
     end
     
  end    
end

action :stop do
  if new_resource.appServerDirectory
     execute "start hybris server" do 
        command "#{new_resource.appServerDirectory}/bin/platform/hybrisserver.sh stop"
        action :run
     end
  end    
end
