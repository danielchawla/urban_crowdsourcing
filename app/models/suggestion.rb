class Suggestion < ActiveRecord::Base
	belongs_to :user
	has_many :comments, :dependent => :destroy

	validates :user_id, :presence => true
		validates :overview, :presence => true, :length => {:maximum => 100}
		validates :description, :presence => true


	geocoded_by :location, :latitude  => :lat, :longitude => :lon
	# geocoded_by :full_street_address   # can also be an IP address
	after_validation :geocode          # auto-fetch coordinates

	
	

end


