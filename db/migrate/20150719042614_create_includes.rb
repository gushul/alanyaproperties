class CreateIncludes < ActiveRecord::Migration
  def change
    create_table :includes do |t|
      t.string :name
      t.timestamps
    end
  end
end
