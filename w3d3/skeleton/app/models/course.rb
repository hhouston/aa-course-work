class Course < ActiveRecord::Base
  has_many :enrollments,
  # course has the primary_key
  primary_key: :id,
  # Enrollment class carry the id
  foreign_key: :course_id,
  class_name: :Enrollment

  has_many :enrolled_students,
  through: :enrollments,
  source: :user

  belongs_to :prerequisite,
  primary_key: :id,
  foreign_key: :prereq_id,
  class_name: :Course

  belongs_to :instructor,
  primary_key: :id,
  # course has the foreign_key
  foreign_key: :instructor_id,
  class_name: :User

end
