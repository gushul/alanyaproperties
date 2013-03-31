class AddVideoToSliders < ActiveRecord::Migration
  def change
    add_column :sliders, :video, :string
  end
end
