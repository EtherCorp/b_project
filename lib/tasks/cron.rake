namespace :cron do
  desc 'Task to load cron tasks with whenever gem'
  task load: [:environment, :dotenv] do
    system 'whenever --update-crontab'
    puts 'Crontab updated'
  end

  desc 'Task to remove cron tasks with whenever gem'
  task remove: [:environment, :dotenv] do
    system 'whenever -c'
    puts 'Crontab removed'
  end
end
