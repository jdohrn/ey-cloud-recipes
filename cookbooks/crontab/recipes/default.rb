#
# Cookbook Name:: crontab
# Recipe:: default
#

# Recipe for testing cron is working properly.
#

if node[:name] == 'opt' 
  cron "import_logistics_execution_file" do 
    minute "45"
    hour '*/1' 
    user 'deploy' 
    command "cd /data/synergy/current && RAILS_ENV=production bundle exec rake edi:import_logistics_execution_file"
  end 
end