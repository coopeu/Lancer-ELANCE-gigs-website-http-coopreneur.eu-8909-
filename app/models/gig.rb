class Gig < ActiveRecord::Base
	belogns_to :user
	has_many :proposals
	belongs_to :category
	has_many :abilities
	has_many :skills, through :abilities

end