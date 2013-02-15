class CreateContactPeople < ActiveRecord::Migration
  def change
    create_table :contact_people do |t|
      t.string :name
      t.string :post
      t.string :photo

      t.timestamps
    end
  end
end
