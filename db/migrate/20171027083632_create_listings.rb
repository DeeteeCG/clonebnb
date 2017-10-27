class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :description
      t.string :property_type
      t.string :num_of_rooms
      t.string :num_of_bathrooms
      t.integer :price

      t.timestamps
    end
  end
end
