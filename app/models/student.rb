class Student < ActiveRecord::Base
	belongs_to :section
	delegate :employee, :to => :section, :allow_nil => true
	has_many :evaluations, :dependent => :destroy
	has_secure_password
end
