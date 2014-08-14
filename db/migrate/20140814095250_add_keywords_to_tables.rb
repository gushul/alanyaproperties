class AddKeywordsToTables < ActiveRecord::Migration
  def change
    add_column :properties, :keywords, :string
    add_column :cities,     :keywords, :string
    add_column :services,   :keywords, :string
  end
end
