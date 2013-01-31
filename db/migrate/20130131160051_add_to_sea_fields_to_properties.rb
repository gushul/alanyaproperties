class AddToSeaFieldsToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :to_sea, :integer
  end
end
