class AddArticlesCountToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :articles_count, :integer, default: 0
  end
end
