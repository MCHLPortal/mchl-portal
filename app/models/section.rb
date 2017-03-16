class Section < ActiveRecord::Base
	has_one :employee
	has_many :students
end
