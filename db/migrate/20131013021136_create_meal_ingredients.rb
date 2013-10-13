class CreateMealIngredients < ActiveRecord::Migration
  def change
    create_table :meal_ingredients do |t|
      t.meal :references
      t.ingredient :references

      t.timestamps
    end
  end
end
