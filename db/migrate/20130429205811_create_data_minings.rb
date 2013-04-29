class CreateDataMinings < ActiveRecord::Migration
  def change
    create_table :data_minings do |t|

      t.timestamps
    end
  end
end
