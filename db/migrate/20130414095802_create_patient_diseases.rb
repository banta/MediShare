class CreatePatientDiseases < ActiveRecord::Migration
  def change
    create_table :patient_diseases do |t|
      t.integer :patient_id
      t.integer :disease_id

      t.timestamps
    end
    add_index :patient_diseases, :patient_id
	add_index :patient_diseases, :disease_id
  end
end
