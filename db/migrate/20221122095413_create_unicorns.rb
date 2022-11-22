class CreateUnicorns < ActiveRecord::Migration[7.0]
  def change
    create_table :unicorns do |t|
      t.string :name
      t.integer :price
      t.string :location
      t.string :species
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
