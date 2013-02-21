class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :key
      t.text :value
      t.integer :model_id
      t.string :model_type

      t.timestamps
    end
  end
end
