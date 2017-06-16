class Article < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true
  belongs_to :category, counter_cache: :articles_count
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  has_many :article_editors
  has_many :editors, through: :article_editors, source: :user

  def editable_by?(user)
    user == author
  end

  def has_this_editor!(user)
    editors << user
  end

  def show_all_editors
    editors
  end
end
