class DrinkController < ApplicationController

    get '/' do
        @drink =  Drink.all.order(:name)
        @drink.to_json

        erb :drinks
    end

    post '/recipe' do
        id = params[:id]
        user_id = session[:user_id]

        @drink = Drink.find(id)
        @liquor_ingredients = @drink.liquor_ingredients
        @liquor_ingredients.each do |item|
            puts item.measure + " " + item.liquor.name
        end
        @mixer_ingredients = @drink.mixer_ingredients

        # check to see if drink is already a favorite
        @user_favorite = false
        @user = User.find(user_id)
        @favorites = @user.user_favorites
        @favorites.each do |fav|
            puts "The drink id is " + id
            puts fav.drink_id
            if (id.to_s == fav.drink_id.to_s)
                @user_favorite = true
            end

        puts "@user_favorite is " + @user_favorite.to_s
        end


        erb :recipe

    end

    patch '/:id' do
        #
    end

    delete '/:id' do
        id = params[:id]

    end

end
