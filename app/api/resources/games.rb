module Resources
  class Games < Grape::API
    version 'v1', using: :path
    format :json
    resource :games do

      desc "Get all games"
      get do
        Game.all
      end

      desc "Get game info using game_name"
      params do
        requires :game_name, type: String
      end
      get ':game_name' do
        Game.find_by game_name: params[:game_name]
      end

      desc "Create a game using params"

      params do
        requires :developer_id, type: Integer
        requires :game_name, type: String
        requires :release_date, type: Date
        requires :description, type: String
      end

      post do
        Game.create!({
          developer_id:params[:developer_id],
          game_name:params[:game_name],
          release_date: params[:release_date],
          description: params[:description]
        })
      end

    end
  end
end
