class AddOnMainToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :on_main, :boolean, default: false
  end
end
