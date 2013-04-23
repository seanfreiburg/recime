class CreateIngredientShoppingLists < ActiveRecord::Migration
  def change
    create_table :ingredient_shopping_lists do |t|
      t.integer :shopping_list_id
      t.integer :ingredient_id
      t.integer :amount

      t.timestamps
    end
  end
end
