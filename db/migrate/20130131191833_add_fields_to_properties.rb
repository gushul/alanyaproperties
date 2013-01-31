class AddFieldsToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :total_area, :integer
    add_column :properties, :property_for, :string
  end
end
