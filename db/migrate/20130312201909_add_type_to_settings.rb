class AddTypeToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :type, :string
    add_index :settings, :type
  end
end
