class RenameArticleInProperties < ActiveRecord::Migration
  def change
    rename_column :properties, :article, :object_id
  end
end
