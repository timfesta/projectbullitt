class Task < ActiveRecord::Base
	belongs_to :npo
  has_many :projects
  has_many :users, through: :projects
end
