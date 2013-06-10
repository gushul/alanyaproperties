class AddSlugToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :slug, :string
    add_column :properties, :url, :string

    add_index :properties, :slug
  end
end
