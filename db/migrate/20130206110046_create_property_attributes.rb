class CreatePropertyAttributes < ActiveRecord::Migration
  def change
    create_table :property_attributes do |t|
      t.string :name
      t.string :attribute_type
      t.text :options
      t.string :default
      t.string :position, default: 0, null: false

      t.timestamps
    end
  end
end
