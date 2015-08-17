class Npo < ActiveRecord::Base
	has_many :issues
	belongs_to :user


end
