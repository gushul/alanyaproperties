class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :oid
      t.date :from
      t.date :to
      t.string :contact_name
      t.string :contact_email
      t.string :contact_phone
      t.integer :property_id

      t.timestamps
    end
  end
end
