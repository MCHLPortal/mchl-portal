class Student < ActiveRecord::Base
	belongs_to :section, :class_name => "Section", :foreign_key => "sections_id"
	delegate :employee, :to => :section, :allow_nil => true
	has_secure_password
end
