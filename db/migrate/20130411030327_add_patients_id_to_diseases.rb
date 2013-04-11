class AddPatientsIdToDiseases < ActiveRecord::Migration
  def change
    add_column :diseases, :patient_id, :integer
  	add_index :diseases, :patient_id
  end
end
