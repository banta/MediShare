class AddNameAndNotesToPrescriptions < ActiveRecord::Migration
  def change
    add_column :prescriptions, :name, :string
    add_column :prescriptions, :notes, :text
  end
end
