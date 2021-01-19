class Book < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :text
    validates :author
    validates :image
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :review
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :review
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  with_options presence: true do
    validates :category_id, numericality: { other_than: 0 }
    validates :review_id, numericality: { other_than: 0 }
  end
  
end
