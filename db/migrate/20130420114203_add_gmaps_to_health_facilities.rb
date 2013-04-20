class AddGmapsToHealthFacilities < ActiveRecord::Migration
  def change
    add_column :health_facilities, :gmaps, :boolean
  end
end
