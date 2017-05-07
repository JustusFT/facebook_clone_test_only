class Like < ActiveRecord::Base
  validates_presence_of :status_id, :user_id
  belongs_to :user
  belongs_to :status
end
