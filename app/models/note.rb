class Note < ActiveRecord::Base
  belongs_to :skill
  belongs_to :user
end
