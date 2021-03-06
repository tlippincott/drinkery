class LiquorController < ApplicationController

    get '/' do
        @liquor =  Liquor.all.order(:name)
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

    patch '/:id' do
        #
    end

    delete '/:id' do
        id = params[:id]

    end

end
