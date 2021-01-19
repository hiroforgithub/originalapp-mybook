class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :nick_name
    validates :birth_day
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i}
  end  

  has_many :books
  has_many :likes, dependent: :destroy
  has_many :liked_books, through: :likes, source: :book

  def already_liked?(book)
    self.likes.exists?(book_id: book.id)
  end  
end
