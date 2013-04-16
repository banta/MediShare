class CreatePrescriptions < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.integer :patient_id

      t.timestamps
    end

    add_index :prescriptions, :patient_id
  end
end
