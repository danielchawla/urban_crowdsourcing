class Suggestion < ActiveRecord::Base
	belongs_to :user
	has_many :comments, :dependent => :destroy

	validates :user_id, :presence => true
		validates :overview, :presence => true, :length => {:maximum => 100}
		validates :description, :presence => true


	geocoded_by :location, :latitude  => :lat, :longitude => :lon
	# geocoded_by :full_street_address   # can also be an IP address
	after_validation :geocode          # auto-fetch coordinates

	has_attached_file :sug_img, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :sug_img, :content_type => /\Aimage\/.*\Z/
	

end


