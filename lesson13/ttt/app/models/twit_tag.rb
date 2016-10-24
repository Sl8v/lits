class TwitTag < ActiveRecord::Base
  belongs_to :twit
  belongs_to :tag
end
