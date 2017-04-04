class Mixer < ActiveRecord::Base

    #has_and_belongs_to_many :drinks, join_table: 'drinks_mixers', class_name: 'Drink'

    has_many :mixer_ingredients

end
