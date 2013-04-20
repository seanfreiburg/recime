class CreateIngredientUsers < ActiveRecord::Migration
  def change
    create_table :ingredient_users do |t|
      t.string :user_id
      t.string :ingredient_id
      t.integer :amount

      t.timestamps
    end
  end
end
