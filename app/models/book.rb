class Book < ApplicationRecord
	belongs_to :user
	attachment :image
	has_many :book_comments, dependent: :destroy
	has_many :favorites,dependent: :destroy
	has_many :comments
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
        end
	validates :title, :body,presence: true
	validates :body,    length: { maximum: 200 }
end
