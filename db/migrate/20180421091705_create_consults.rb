class CreateConsults < ActiveRecord::Migration[5.2]
  def change
    create_table :consults do |t|
      t.integer :user_id
      t.text :history
      t.text :prescription
      t.integer :mc
      t.integer :doctor_id

      t.timestamps
    end
  end
end
