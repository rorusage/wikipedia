class Category < ActiveRecord::Base
  belongs_to :owner, class_name: "User", foreign_key: :user_id
  has_many :articles
  validates :name, presence: true

  def editable_by?(user)
    user == owner
  end
end
