class AddFieldsToCities < ActiveRecord::Migration
  def change
    add_column :cities, :name_case, :string
    add_column :cities, :url, :string
    add_column :cities, :slug, :string

    add_index :cities, :slug, :unique => true
  end
end
