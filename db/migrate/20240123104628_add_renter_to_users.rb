class AddRenterToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :renter, :boolean
  end
end
