class AddUserIdToHealthFacilities < ActiveRecord::Migration
  def change
    add_column :health_facilities, :user_id, :integer
    add_index(:health_facilities, :user_id)
  end
end
