class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.text :body
      t.boolean :is_main
      t.string :slug

      t.timestamps
    end
  end
end
