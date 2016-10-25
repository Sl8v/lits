class Tag < ActiveRecord::Base
  # belongs_to :twit
  # has_many :twits
  has_many :twit_tags
  has_many :twits, through: :twit_tags
end
