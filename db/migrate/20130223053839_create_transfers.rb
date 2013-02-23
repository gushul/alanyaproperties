class CreateTransfers < ActiveRecord::Migration
  def change
    create_table :transfers do |t|
      t.string :transfer_type
      t.string :flight_number
      t.string :date_arrival
      t.string :time_arrival
      t.integer :terminal
      t.string :address
      t.integer :people
      t.string :contact_name
      t.string :contact_phone
      t.string :contact_email

      t.timestamps
    end
  end
end
