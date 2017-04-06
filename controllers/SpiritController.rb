class LiquorController < ApplicationController

    get '/' do
        @liquor =  Liquor.all
        @liquor.to_json

        erb :liquors
    end

    post '/drinks' do
        id = params[:id]
        @drink = []

        @liquor = Liquor.find(id)
        @liquor_ingredients = @liquor.liquor_ingredients
        @liquor_ingredients.each do |item|
            #puts item.drink.name
            @drink.push(id: item.drink.id, name: item.drink.name)
        end

        @drink.to_json

        erb :drinks

    end

    post '/liquoringredients' do
        id = params[:id]

        @drink = Drink.find(id)
        @liquor_ingredients = @drink.liquor_ingredients
        #@liquors = @drink.liquors
        @liquor_ingredients.each do |item|
            puts item.measure + " " + item.liquor.name
        end
        @mixer_ingredients = @drink.mixer_ingredients
        #@drink_liquor_recipe = {drink: @drink, liquor: @liquors, mixer: @mixers}
        #@drink_liquor_recipe.to_json

        erb :recipe

    end

    patch '/:id' do
        #
    end

    delete '/:id' do
        id = params[:id]

    end

end
