class AddColumnForListings < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :address, :string
    add_column :listings, :city, :string
    add_column :listings, :country, :string
    add_column :listings, :max_guest, :string
    add_column :listings, :no_of_bed, :string
  end
end
