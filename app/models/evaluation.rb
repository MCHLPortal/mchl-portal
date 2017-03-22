class Evaluation < ApplicationRecord
	belongs_to :student
	has_many :domains, :dependent => :destroy
	accepts_nested_attributes_for :domains
end
