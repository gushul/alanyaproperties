class CreateAboutPages < ActiveRecord::Migration
  def change
    create_table :about_pages do |t|
      t.string :title
      t.text :body
      t.string :url
      t.string :slug
      t.boolean :default

      t.timestamps
    end

    add_index :about_pages, :slug, unique: true
  end
end
