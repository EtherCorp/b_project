module V1
  class ServerStatusLogs < Grape::API
    resource :server_status_logs do
      desc 'get last 10 logs about server hardware status'
      get do
        present ServerStatusLog.all.limit(10), with: Entities::ServerStatusLogEntity
      end
    end
  end
end
