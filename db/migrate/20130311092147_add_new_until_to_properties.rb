class AddNewUntilToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :new_until, :date
  end
end
