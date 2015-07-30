class AddOurToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :our, :boolean, default: false
  end
end
