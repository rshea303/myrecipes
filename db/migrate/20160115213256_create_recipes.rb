class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :summary
      t.text :description
      t.references :chef, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
