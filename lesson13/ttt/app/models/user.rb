class User < ActiveRecord::Base
  before_destroy { false if self.nickname == 'Admin'}
  before_save { self.email = email.downcase }
  has_many :twits, dependent: :destroy

  validates :nickname, presence: true, uniqueness: true, length: { in: 3..20 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  has_many :comments, dependent: :destroy

end
