class Comment < ActiveRecord::Base
  belongs_to :twit
  belongs_to :user
  validates :user_id, presence: true
  validates :twit_id, presence: true
  validates :body, presence: true
end
