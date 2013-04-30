class CreateDmresults < ActiveRecord::Migration
  def change
    create_table :dmresults do |t|
      t.string :rule
      t.float :support
      t.float :total
      t.float :confidence
      t.integer :data_mining_id

      t.timestamps
    end
    add_index :dmresults, :data_mining_id
  end
end
