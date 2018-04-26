class MakeUnique < ActiveRecord::Migration[5.2]
  def change
    change_column :requests, :user_id, :integer, unique: true
  end
end
