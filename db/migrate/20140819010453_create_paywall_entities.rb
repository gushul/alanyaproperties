class CreatePaywallEntities < ActiveRecord::Migration
  def change
    create_table :paywall_entities do |t|
      t.references :paywall
      t.references :entity, polymorphic: true

      t.timestamps
    end
    add_index :paywall_entities, [:paywall_id, :entity_id, :entity_type], uniq: true, name: 'paywall_entities_index'
  end
end
