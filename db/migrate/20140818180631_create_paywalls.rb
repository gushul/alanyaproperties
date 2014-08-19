class CreatePaywalls < ActiveRecord::Migration
  def change
    create_table :paywalls do |t|
      t.string :name, null: false
      t.string :title
      t.text :content, null: false
      t.integer :seconds, null: false, default: 0

      t.timestamps
    end
    add_index :paywalls, :name, :unique => true
  end
end
