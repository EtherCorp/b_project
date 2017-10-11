module Resources
  class Wishlists < Grape::API
    version 'v1', using: :path
    format :json
    resource :wishlists do

      desc "Get all wishlists for all user"
      get do
        Wishlist.all
      end

      desc "Create a Wishlist for a user_id using a product_id"

      params do
        requires :user_id, type: Integer
        requires :product_id, type: Integer
      end

      post do
        Wishlist.create!({
          user_id:params[:user_id],
          product_id:params[:product_id]
        })
      end

      desc "Get all wishlists by user_id"
      params do
        requires :id, type: Integer
      end
      get ':id' do
        Wishlist.where user_id: params[:id]
      end



    end
  end
end
