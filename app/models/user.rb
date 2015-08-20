class User < ActiveRecord::Base

	has_secure_password


  validates_presence_of :password_confirmation

  # relationships
	has_many :npos
  has_many :projects
  has_many :tasks, through: :projects


# for profile photos
  has_attached_file :avatar,
                    :styles => { :medium => "150x150>", :thumb => "44x44>" },
                    :storage => :s3,
                    :s3_credentials => Proc.new { |a| a.instance.s3_credentials },
                    :path => "avatars/:id/:style/avatar.:extension",
                    :default_url => "https://s3.amazonaws.com/<<BUCKET>>/defaults/default_avatar.png"

                   		# :avatar, :presence => true,
 validates_attachment :avatar,
                      :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
                      :size => { :in => 0..100000.kilobytes }


  def s3_credentials
    { :bucket => ENV['S3_BUCKET'], :access_key_id => ENV['S3_PUBLIC_KEY'], :secret_access_key => ENV['S3_SECRET'] }
  end

end
