class ChangeColumnNameToListings < ActiveRecord::Migration[5.1]
  def change
    rename_column :listings, :no_of_bed, :num_of_beds
  end
end
