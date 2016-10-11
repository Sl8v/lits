class Twit < ActiveRecord::Base
  belongs_to :user

  validates :user_id, :presence => true
                      # :content => { :minimum => 5 }

  has_many :comments, dependent: :destroy
end
