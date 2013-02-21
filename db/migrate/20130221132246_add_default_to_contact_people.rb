class AddDefaultToContactPeople < ActiveRecord::Migration
  def change
    add_column :contact_people, :default, :boolean, default: false
  end
end
