class AddTokenForAuthentications < ActiveRecord::Migration[5.1]
  def change
    add_column :authentications, :token, :string
  end
end
