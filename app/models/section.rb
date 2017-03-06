class Section < ActiveRecord::Base
	has_one :employee, :class_name => "Employee", :foreign_key => "sections_id"
	has_many :student, :class_name => "Student", :foreign_key => "sections_id"
end
