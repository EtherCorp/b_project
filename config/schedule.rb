# whenever cron jobs
set :output, {error: 'log/cron_errors.log', standard: 'log/cron.log'}
set :environment, 'development'
env :PATH, ENV['PATH']

# Monitor harware system every 15 minutes
every 15.minutes do
  rake 'monitor:system'
end

# Monitor Scraping sites status every hour
every :hour do
  rake 'monitor:connection'
end
