class CreateManagerPeople < ActiveRecord::Migration
  def change
    create_table :manager_people do |t|
      t.string :name
      t.string :position
      t.string :skype
      t.string :location
      t.string :phono
      t.string :language

      t.timestamps
    end
  end
end
