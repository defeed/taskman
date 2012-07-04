class Task < ActiveRecord::Base
  attr_accessible :title, :completed, :description, :due_date, :list_id, :user_id
  belongs_to :list
  belongs_to :user
  has_many :comments, :dependent => :destroy
  
  validates :title, :presence => true
  
  scope :completed, where(:completed => true)
  scope :incomplete, where(:completed => false)
  scope :due_today, where("due_date = ?", Time.now.to_date)
end
