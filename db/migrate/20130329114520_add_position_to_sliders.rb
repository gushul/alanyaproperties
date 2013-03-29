class AddPositionToSliders < ActiveRecord::Migration
  def change
    add_column :sliders, :position, :integer, default: 0
  end
end
