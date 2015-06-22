class Suggestion < ActiveRecord::Base
	belongs_to :user
	has_many :comments, :dependent => :destroy

	validates :user_id, :presence => true
		validates :overview, :presence => true, :length => {:maximum => 100}
		validates :description, :presence => true
end


