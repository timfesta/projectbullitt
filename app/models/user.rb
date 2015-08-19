class User < ActiveRecord::Base
	has_secure_password
	has_many :npos
  has_many :projects
  has_many :tasks, through: :projects


# for profile photos
  has_attached_file :avatar,
                   :styles => { :medium => "150x150>", :thumb => "44x44" },
                   :default_url => "/images/:style/missing.png"

                   		# :avatar, :presence => true,
 validates_attachment :avatar,
                      :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
                      :size => { :in => 0..100000.kilobytes }


end
