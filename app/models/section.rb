class Section < ActiveRecord::Base
	validates :name, presence: true
	validates :level, presence: true
	validates :room_number, presence: true


	has_one :employee
	has_many :students
end
