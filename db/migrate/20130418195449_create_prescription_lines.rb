class CreatePrescriptionLines < ActiveRecord::Migration
  def change
    create_table :prescription_lines do |t|
      t.string :quantity
      t.integer :frequency
      t.string :time
      t.integer :period_no
      t.string :period

      t.timestamps
    end
  end
end
