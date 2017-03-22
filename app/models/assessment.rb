class Assessment < ApplicationRecord
	has_many :students
	has_many :payments, through: :students
end
