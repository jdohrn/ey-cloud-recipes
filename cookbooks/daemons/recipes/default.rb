
daemons_to_load = [
  { :command_name => 'carrier_tenderer', 
    :command_to_run => 'bundle exec rake daemons:carrier_tenderer RAILS_ENV=production',
    :app_name => 'synergy',
    :run_in_background => true
  },
  { :command_name => 'pickup_monitor', 
    :command_to_run => 'bundle exec rake pickup_monitor:testies RAILS_ENV=production',
    :app_name => 'synergy',
    :run_in_background => true
  }
]

if ['util'].include?(node[:instance_role])
  service "monit" do
    supports :reload => true
    action :enable
  end
  
  daemons_to_load.each do |d|
    
    template "/usr/local/bin/#{d[:command_name]}_wrapper" do
      owner node[:owner_name]
      group node[:group_name]
      mode 0755
      source "wrapper.sh.erb"
      variables({:command_name => d[:command_name],
                 :command_to_run => d[:command_to_run],
                 :run_in_background => d[:run_in_background]})
    end

    template "/etc/monit.d/#{d[:app_name]}_#{d[:command_name]}.monitrc" do
      owner 'root'
      group 'root'
      mode 0644
      source 'monitrc.erb'
      variables({:app_name => d[:app_name],
                 :command_name => d[:command_name],
                 :command_to_run => d[:command_to_run]})
      notifies :reload, resources(:service => 'monit')
    end
    
  end

end