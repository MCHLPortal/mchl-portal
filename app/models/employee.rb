class Employee < ActiveRecord::Base
	belongs_to :section, :class_name => "Section", :foreign_key => "sections_id"
	has_many :student, through: :section, :class_name => "Student", :foreign_key => "sections_id"
	has_secure_password
end
