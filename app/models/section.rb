class Section < ActiveRecord::Base
	has_one :teacher, :class_name => "Teacher", :foreign_key => "sections_id"
end
