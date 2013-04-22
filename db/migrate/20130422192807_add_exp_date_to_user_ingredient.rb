class AddExpDateToUserIngredient < ActiveRecord::Migration
  def change
    add_column :ingredient_users, :exp_date, :date
  end
end
