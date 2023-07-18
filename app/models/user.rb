class User < ApplicationRecord
  has_many :authored_books, class_name: 'Book', foreign_key: 'author_id'
  has_many :checked_out_books, class_name: 'Book', foreign_key: 'checked_out_by_id'

  validates :email, format: { with: /\A(.+)@(.+)\z/, message: "Email invalid" }, uniqueness: { case_sensitive: false }, length: { minimum: 4, maximum: 254 }  
end
