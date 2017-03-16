class Employee < ActiveRecord::Base
	belongs_to :section
	has_many :students, through: :section
	has_secure_password
end
