class CreatePropertiesIncludes < ActiveRecord::Migration
  def change
    create_table :properties_includes do |t|
      t.belongs_to :include, index: true
      t.belongs_to :property, index: true
      t.datetime :appointment_date
      t.timestamps
    end
  end
end
