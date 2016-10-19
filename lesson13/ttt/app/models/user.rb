class User < ActiveRecord::Base

  has_many :twits, dependent: :destroy

end
