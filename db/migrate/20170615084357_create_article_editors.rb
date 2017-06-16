class CreateArticleEditors < ActiveRecord::Migration
  def change
    create_table :article_editors do |t|
      t.integer :article_id
      t.integer :editor_id

      t.timestamps null: false
    end
  end
end
