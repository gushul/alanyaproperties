class AddManagerPersonPhotoToManagerPerson < ActiveRecord::Migration
  def change
    add_column :manager_people, :photo, :string
  end
end
