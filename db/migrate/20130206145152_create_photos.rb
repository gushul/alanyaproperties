class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.string :alt
      t.string :picture
      t.string :gallery_id
      t.string :gallery_type

      t.timestamps
    end
    add_index :photos, [:gallery_id, :gallery_type]
  end
end
