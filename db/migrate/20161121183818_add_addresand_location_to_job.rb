class AddAddresandLocationToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :address, :string
    add_column :jobs,  :location, :string
  end
end
