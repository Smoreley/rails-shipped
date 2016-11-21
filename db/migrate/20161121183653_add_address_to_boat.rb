class AddAddressToBoat < ActiveRecord::Migration[5.0]
  def change
    add_column :boats, :address, :string
  end
end
