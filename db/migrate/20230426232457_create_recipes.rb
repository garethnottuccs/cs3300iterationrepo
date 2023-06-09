class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :category
      t.text :ingredients
      t.text :instructions
      t.integer :rating

      t.timestamps
    end
  end
end
