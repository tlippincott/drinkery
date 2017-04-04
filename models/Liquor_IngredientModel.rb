class LiquorIngredient < ActiveRecord::Base
      self.table_name = "liquor_ingredients"

      belongs_to :drink
      belongs_to :liquor
end
