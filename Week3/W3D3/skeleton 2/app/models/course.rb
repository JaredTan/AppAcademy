class Course < ActiveRecord::Base

  has_many :enrolled_students,
    source: :user,
    through: :enrollments

  has_many :enrollments,
    primary_key: :id,
    foreign_key: :course_id,
    class_name: "Enrollment"

  has_many :pre_reqs,
    class_name: "Course",
    foreign_key: :id,
    primary_key: :prereq_id

  has_one :instructor,
    class_name: "User",
    foreign_key: :id,
    primary_key: :instructor_id



end
