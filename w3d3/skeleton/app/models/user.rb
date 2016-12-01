class User < ActiveRecord::Base
  has_many :enrollments,
  primary_key: :id,
  foreign_key: :student_id,
  class_name: :Enrollment

  has_many :enrolled_courses,
  # JOIN 
  :through => :enrollments,
  #name of the association
  :source => :course
end
