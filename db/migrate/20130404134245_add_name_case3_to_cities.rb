class AddNameCase3ToCities < ActiveRecord::Migration
  def change
    add_column :cities, :name_case3, :string
  end
end
