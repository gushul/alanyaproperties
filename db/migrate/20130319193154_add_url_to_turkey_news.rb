class AddUrlToTurkeyNews < ActiveRecord::Migration
  def change
    add_column :turkey_news, :url, :string
  end
end
