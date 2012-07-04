class Comment < ActiveRecord::Base
  attr_accessible :body, :task_id, :user_id
  belongs_to :user
  belongs_to :task
  validates :body, :presence => true, :length => { :minimum => 2 }
end
