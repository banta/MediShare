class Change < ActiveRecord::Migration
  def up
  	change_column :health_facilities, :latitude, :float
  	change_column :health_facilities, :longitude, :float
  end

  def down
  	change_column :health_facilities, :latitude, :string
  	change_column :health_facilities, :longitude, :string
  end
end
