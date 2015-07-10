class AddCountOfViewsToModels < ActiveRecord::Migration
  def change
    add_column :properties,  :count_of_views, :integer, default: 0, null: false
    add_column :cities,      :count_of_views, :integer, default: 0, null: false
    add_column :services,    :count_of_views, :integer, default: 0, null: false
    add_column :turkey_news, :count_of_views, :integer, default: 0, null: false
    add_column :about_pages, :count_of_views, :integer, default: 0, null: false
  end
end
