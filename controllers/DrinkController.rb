class DrinkController < ApplicationController

    get '/' do
        @drink =  Drink.all.order(:name)
        @drink.to_json

        erb :drinks
    end

    post '/recipe' do
        id = params[:id]

        @drink = Drink.find(id)
        @liquor_ingredients = @drink.liquor_ingredients
        @liquor_ingredients.each do |item|
            puts item.measure + " " + item.liquor.name
        end
        @mixer_ingredients = @drink.mixer_ingredients

        erb :recipe

    end

    patch '/:id' do
        #
    end

    delete '/:id' do
        id = params[:id]

    end

end
