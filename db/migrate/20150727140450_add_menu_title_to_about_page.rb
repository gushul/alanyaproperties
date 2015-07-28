class AddMenuTitleToAboutPage < ActiveRecord::Migration
  def change
    add_column :about_pages, :menu_title, :string
  end
end
