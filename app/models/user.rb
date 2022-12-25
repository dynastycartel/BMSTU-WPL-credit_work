class User < ApplicationRecord
  has_secure_password

  validates :contact_name, presence: true, format: {
    with: /\A(\p{Cyrillic}+ ?)+\z/,
    message: 'имеет недопустимый формат'
  }
  validates :email, presence: true, uniqueness: true, format: { 
    with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i,
    message: 'имеет недопустимый формат'
  }
end
