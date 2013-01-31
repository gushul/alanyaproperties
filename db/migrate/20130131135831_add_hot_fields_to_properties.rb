class AddHotFieldsToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :hot, :boolean
  end
end
