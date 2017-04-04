class Liquor < ActiveRecord::Base

    #has_and_belongs_to_many :drinks, join_table: 'liquor_ingredients', class_name: 'Drink'

    has_many :liquor_ingredients

end
