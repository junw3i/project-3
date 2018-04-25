class AddDetailsToConsults < ActiveRecord::Migration[5.2]
  def change
    add_column :consults, :mc_start, :string
    add_column :consults, :mc_end, :string
  end
end
