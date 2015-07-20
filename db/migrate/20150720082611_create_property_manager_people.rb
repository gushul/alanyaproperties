class CreatePropertyManagerPeople < ActiveRecord::Migration
  def change
    create_table :property_manager_people do |t|
      t.belongs_to :manager_person, index: true
      t.belongs_to :property, index: true
      t.datetime :appointment_date

      t.timestamps
    end
  end
end
