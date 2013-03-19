class AddTypeToTurkeyNews < ActiveRecord::Migration
  def change
    add_column :turkey_news, :article_type, :string
  end
end
