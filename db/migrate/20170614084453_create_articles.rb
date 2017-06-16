class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.references :category, index: true

      t.timestamps null: false
    end
    add_foreign_key :articles, :categories
  end
end
