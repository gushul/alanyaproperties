class CreateSliders < ActiveRecord::Migration
  def change
    create_table :sliders do |t|
      t.string :photo
      t.string :model_type
      t.string :model_id
      t.text :data

      t.timestamps
    end
  end
end
