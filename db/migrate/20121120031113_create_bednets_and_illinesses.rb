class CreateBednetsAndIllinesses < ActiveRecord::Migration
  def change
    create_table :bednets_and_illinesses do |t|
      t.string :county
      t.float :under_net
      t.float :fever_or_malaria
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
