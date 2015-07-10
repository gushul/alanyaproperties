class CreateHotOffers < ActiveRecord::Migration
  def change
    create_table :hot_offers do |t|
      t.references :offerable, polymorphic: true
      t.string :title
      t.string :description
      t.boolean :publish, default: false, null: false
      t.string :color, null: false

      t.timestamps
    end

    add_index :hot_offers, [:offerable_type, :offerable_id], uniq: true
  end
end
