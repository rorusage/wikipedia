class ChangeColumnDefault < ActiveRecord::Migration
  def change
    change_column :categories, :articles_count, :integer, default:0
  end
end
