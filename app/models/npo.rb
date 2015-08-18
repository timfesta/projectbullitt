class Npo < ActiveRecord::Base
	has_many :issues
	has_many :tasks
	belongs_to :user
 
end
