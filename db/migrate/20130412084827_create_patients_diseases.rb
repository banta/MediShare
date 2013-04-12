class CreatePatientsDiseases < ActiveRecord::Migration
  def change
    create_table :patients_diseases do |t|
      t.references :patient
      t.references :disease 

      t.timestamps
    end
    add_index :patients_diseases, :patient_id
    add_index :patients_diseases, :disease_id
  end
end
