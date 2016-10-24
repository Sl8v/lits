class User < ActiveRecord::Base

  has_many :twits, dependent: :destroy

  validates :nickname, uniqueness: true, length: { in: 3..20 }
  validates :email, :presence => true

  has_many :comments, dependent: :destroy

end
