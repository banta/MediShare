class CreateHealthFacilities < ActiveRecord::Migration
  def change
    create_table :health_facilities do |t|
      t.string :name
      t.string :hmis
      t.string :province
      t.string :district
      t.string :division
      t.string :location
      t.string :sub_location
      t.string :srm
      t.string :type
      t.string :agency
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
