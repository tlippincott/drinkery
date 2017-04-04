class Drink < ActiveRecord::Base

    #has_and_belongs_to_many :liquors, join_table: 'liquor_ingredients', class_name: 'Liquor'
    #has_and_belongs_to_many :mixers, join_table: 'drinks_mixers', class_name: 'Mixer'

    has_many :liquor_ingredients
    has_many :mixer_ingredients

end
