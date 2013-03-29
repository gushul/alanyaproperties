class AddNameCase2ToCities < ActiveRecord::Migration
  def change
    add_column :cities, :name_case2, :string
  end
end
