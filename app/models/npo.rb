class Npo < ActiveRecord::Base
	has_many :tasks
	belongs_to :user
  has_many :projects, through: :tasks
 
# for Npo photos
  has_attached_file :avatar,
                    :styles => { :medium => "150x150>", :thumb => "44x44>" },
                    :storage => :s3,
                    :s3_credentials => Proc.new { |a| a.instance.s3_credentials },
                    :path => "avatars/:id/:style/avatar.:extension",
                    :default_url => "https://s3.amazonaws.com/vagabondapps/avatars/Developerswithoutborders/building.png"

                   		# :avatar, :presence => true,
 validates_attachment :avatar,
                      :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
                      :size => { :in => 0..100000.kilobytes }


  def s3_credentials
    { :bucket => ENV['S3_BUCKET'], :access_key_id => ENV['S3_PUBLIC_KEY'], :secret_access_key => ENV['S3_SECRET'] }
  end
  
end
