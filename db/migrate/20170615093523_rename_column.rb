class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :article_editors, :editor_id, :user_id
  end
end
