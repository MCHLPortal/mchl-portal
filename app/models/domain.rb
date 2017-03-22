class Domain < ApplicationRecord
	belongs_to :evaluation
	has_many :skills, :dependent => :destroy
	accepts_nested_attributes_for :skills
end
