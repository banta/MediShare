class AddAddressToHealthFacility < ActiveRecord::Migration
  def change
    add_column :health_facilities, :address, :string
  end
end
