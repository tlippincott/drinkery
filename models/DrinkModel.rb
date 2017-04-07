class Drink < ActiveRecord::Base

    has_many :liquor_ingredients
    has_many :mixer_ingredients
    has_many :user_favorites

end
