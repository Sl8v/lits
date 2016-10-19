class Tag < ActiveRecord::Base
  belongs_to :twit
  has_many :twits
end
