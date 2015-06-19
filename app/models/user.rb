class User < ActiveRecord::Base



	has_many :suggestions, :dependent => :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	validates :first_name, :presence => true
	validates :last_name, :presence => true
	validates :age, :presence => true, :numericality => {:only_integer => true}
	validates :occupation, :presence => true
	validates :gender, :presence => true
end

 

  # create_table "users", force: :cascade do |t|
  #   t.string   "first_name"
  #   t.string   "last_name"
  #   t.integer  "age"
  #   t.string   "occupation"
  #   t.string   "gender"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  # end
