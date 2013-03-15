class AddSourceToHealthFacilities < ActiveRecord::Migration
  def change
    add_column :health_facilities, :source, :string
  end
end
