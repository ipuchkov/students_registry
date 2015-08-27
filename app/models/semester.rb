class Semester < ActiveRecord::Base
  belongs_to :group
  has_many   :semester_subjects, :dependent => :destroy
  has_many   :subjects,          :through   => :semester_subjects
end
