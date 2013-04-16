class CreatePrescriptionDiseases < ActiveRecord::Migration
  def change
    create_table :prescription_diseases do |t|
      t.integer :prescription_id
      t.integer :disease_id

      t.timestamps
    end
    
    add_index :prescription_diseases, :prescription_id
	add_index :prescription_diseases, :disease_id
  end
end
