class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :email
      t.string :name
      t.string :position
      t.string :photo
      t.string :phone
      t.string :skype
      t.string :languages

      t.timestamps
    end
  end
end
