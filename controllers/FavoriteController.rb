class FavoriteController < ApplicationController

    get '/' do
        user_id = session[:user_id]
        @drink = []

        @user = User.find(user_id)
        @favorites = @user.user_favorites
        @favorites.each do |item|
            @drink.push(id: item.drink.id, name: item.drink.name)
        end

        @drink.to_json

        erb :favorite

    end

    post '/' do
        drink_id = params[:id]

        userfavorite = UserFavorite.new

        userfavorite.user_id = session[:user_id]
        userfavorite.drink_id = drink_id

        userfavorite.save

    end

    patch '/:id' do
        #
    end

    delete '/' do
        user_drink_id = params[:id]

        UserFavorite.where({user_id: session[:user_id], drink_id: user_drink_id}).delete_all

        'Success'

    end

end
