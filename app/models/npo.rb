class Npo < ActiveRecord::Base
	has_many :tasks
	belongs_to :user
  has_many :projects, through: :tasks
 
end
