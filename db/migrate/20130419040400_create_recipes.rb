class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :prep_time
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
