class CreateTurkeyNews < ActiveRecord::Migration
  def change
    create_table :turkey_news do |t|
      t.string :title
      t.text :teaser
      t.text :body
      t.string :slug
      t.string :photo

      t.timestamps
    end
  end
end
