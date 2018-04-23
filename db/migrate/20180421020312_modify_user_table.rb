class ModifyUserTable < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :role, :string, default: "patient"
    add_column :users, :id_number, :string
    add_column :users, :gender, :string
    add_column :users, :mobile, :integer
    add_column :users, :is_live, :boolean, default: "true"
  end
end
