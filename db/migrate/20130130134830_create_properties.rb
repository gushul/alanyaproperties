class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :name
      t.string :article
      t.text :description
      t.string :property_type
      t.string :property_kind
      t.integer :price
      t.references :city
      t.string :photo
      t.text :geo
      t.text :property_attributes

      t.timestamps
    end
    add_index :properties, :city_id
  end
end
