class CreatePropertiesIncludes < ActiveRecord::Migration
  def change
    create_table :properties_includes do |t|
      t.belongs_to :inludes, index: true
      t.belongs_to :properties, index: true
      t.datetime :appointment_date
      t.timestamps
    end
  end
end
