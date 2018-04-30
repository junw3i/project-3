class AddAppointmentToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :appointment_date, :string
  end
end
