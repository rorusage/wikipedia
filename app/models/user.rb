class User < ActiveRecord::Base
  has_many :categories
  has_many :articles
  has_many :article_editors
  has_many :editted_articles, through: :article_editors, source: :article
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
