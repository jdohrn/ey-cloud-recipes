#
# Cookbook Name:: crontab
# Recipe:: default
#

# Recipe for testing cron is working properly.
#

if node[:name] == 'opt' 
  cron "import_logistics_execution_file" do 
    minute "55"
    hour '*/1' 
    user 'deploy' 
    command "cd /data/synergy/current && RAILS_ENV=production bundle exec rake edi:import_logistics_execution_file"
  end 
  cron "opt1" do
    minute '33'
    hour '*/1'
    user 'deploy'
    command "cd /data/synergy/current && RAILS_ENV=production bundle exec rake optimization:opt1"
  end
  cron "opt2" do
    minute '36'
    hour '*/1'
    user 'deploy'
    command "cd /data/synergy/current && RAILS_ENV=production bundle exec rake optimization:opt2"
  end
  cron "opt3" do
    minute '37'
    hour '*/1'
    user 'deploy'
    command "cd /data/synergy/current && RAILS_ENV=production bundle exec rake optimization:opt3"
  end
  cron "opt4" do
    minute '38'
    hour '*/1'
    user 'deploy'
    command "cd /data/synergy/current && RAILS_ENV=production bundle exec rake optimization:opt4"
  end
  cron "opt5" do
    minute '39'
    hour '*/1'
    user 'deploy'
    command "cd /data/synergy/current && RAILS_ENV=production bundle exec rake optimization:opt5"
  end
  cron "opt_recap" do
    minute '5'
    hour '*/1'
    user 'deploy'
    command "cd /data/synergy/current && RAILS_ENV=production bundle exec rake optimization:opt_recap"
  end
  cron "route_pickup_routings" do
    minute '*/5'
    hour '*'
    user 'deploy'
    command "cd /data/synergy/current && RAILS_ENV=production bundle exec rake optimization:route_pickup_routings"
  end
  cron "process_batch_rater_requests" do
    minute '15'
    hour '*/1'
    user 'deploy'
    command "cd /data/synergy/current && RAILS_ENV=production bundle exec rake rating:process_batch_rater_requests"
  end
  cron "weekly_maintenance_cycle" do
    minute '0'
    hour '9'
    weekday '6'
    user 'deploy'
    command "cd /data/synergy/current && RAILS_ENV=production bundle exec rake maintenance:weekly_maintenance_cycle"
  end
elsif node[:name] == 'opx' 
  cron "deere_daily_optimization_cycle" do
    minute '0'
    hour '*/2'
    weekday '1-5'
    user 'deploy'
    command "cd /data/synergy/current && RAILS_ENV=production bundle exec rake monitoring:testy"
  end
end