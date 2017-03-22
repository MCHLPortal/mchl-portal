# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Employee.create(fname: "Justfer", mname: "Aguilar", lname: "Fernandez", employee_id: "e20140287", username: "efernandez_jusa", password: "e20140287fernandez", admin: true)

Assessment.create(tuition: 0.0, other_fees: 0.0, other_assessment: 0.0, total_assessment: 0.0, level: "Nursery")
Assessment.create(tuition: 0.0, other_fees: 0.0, other_assessment: 0.0, total_assessment: 0.0, level: "Kindergarten")
Assessment.create(tuition: 0.0, other_fees: 0.0, other_assessment: 0.0, total_assessment: 0.0, level: "Preparatory")