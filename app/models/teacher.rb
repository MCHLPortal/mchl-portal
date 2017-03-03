class Teacher < ActiveRecord::Base
	belongs_to :section, :class_name => "Section", :foreign_key => "sections_id"
end
