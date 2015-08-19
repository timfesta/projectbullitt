class Npo < ActiveRecord::Base
	has_many :tasks
	belongs_to :user
  has_many :projects, through: :tasks
 
  has_attached_file :avatar,
                   :styles => { :medium => "200x200>", :thumb => "44x44#" },
                   :default_url => "/images/:style/missing.png"

 validates_attachment :avatar, :presence => true,
                      :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
                      :size => { :in => 0..100000.kilobytes }
end
