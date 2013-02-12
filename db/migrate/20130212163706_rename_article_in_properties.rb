class RenameArticleInProperties < ActiveRecord::Migration
  def change
    rename_column :properties, :article, :oid
  end
end
