class Suggestion < ActiveRecord::Base
	belongs_to :user

	validates :user_id, :presence => true
		validates :overview, :presence => true, :length => {:maximum => 100}
		validates :description, :presence => true
end


