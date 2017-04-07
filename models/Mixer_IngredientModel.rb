class MixerIngredient < ActiveRecord::Base
    self.table_name = "mixer_ingredients"

    belongs_to :drink
    belongs_to :mixer
end
