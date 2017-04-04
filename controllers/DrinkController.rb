class DrinkController < ApplicationController

  get '/' do
      @drink =  Drink.all
      @drink.to_json
  end

  get '/:id' do
    id = params[:id]

  end

    get '/:id/recipe' do
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

  get '/:id/locations' do
    id = params[:id]

    @course = Course.find(id)
    @locations = @course.locations
    @locations.to_json
  end

  post '/' do
    my_course = JSON.parse(request.body.read)
    @course = Course.new
    @course.title = my_course["name"]
    @course.save

    @courses = Course.all
    @courses.to_json
  end

  patch '/:id' do
    #
  end

  delete '/:id' do
    id = params[:id]

  end

end
