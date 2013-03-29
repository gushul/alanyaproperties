class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :name
      t.string :description
      t.string :tip
      t.string :link
      t.string :position
      t.integer :price
      t.date :until
      t.boolean :active
      t.string :picture
      t.string :for
      t.integer :city_id

      t.timestamps
    end
  end
end
