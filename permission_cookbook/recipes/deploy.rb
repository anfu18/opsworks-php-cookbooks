node[:deploy].each do |app_name, deploy|

  if deploy[:application] == "core"
    script "set_permissions" do
        interpreter "bash"
        user "root"
        cwd "#{deploy[:deploy_to]}/current/app"
        code <<-EOH
        chmod -R 777 tmp
        EOH
    end
  elsif File.exist?("storage")
   script "set_permissions" do
       interpreter "bash"
       user "root"
       cwd "#{deploy[:deploy_to]}/current/app"
       code <<-EOH
       chmod -R 777 storage
       EOH
   end
  end

end