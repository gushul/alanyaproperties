class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :type
      t.string :asset
      t.belongs_to :attachment, polymorphic: true

      t.timestamps
    end
    add_index :assets, [:attachment_id, :attachment_type]
  end
end
