class CreateMealIngredients < ActiveRecord::Migration
  def change
    create_table :meal_ingredients do |t|
      t.references :meal, index: true
      t.references :ingredient, index: true

      t.timestamps
    end
  end
end
