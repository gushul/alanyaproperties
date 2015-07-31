class CreateUsefulNews < ActiveRecord::Migration
  def change
    create_table :useful_news do |t|
      t.string :title
      t.string :teaser
      t.text :body

      t.timestamps
    end
  end
end
