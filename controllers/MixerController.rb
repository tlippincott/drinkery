class MixerController < ApplicationController

    get '/' do
        @mixer =  Mixer.all.order(:name)
        @mixer.to_json

        erb :mixers
    end

    post '/drinks' do
        id = params[:id]
        @drink = []

        @mixer = Mixer.find(id)
        @mixer_ingredients = @mixer.mixer_ingredients
        @mixer_ingredients.each do |item|
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
