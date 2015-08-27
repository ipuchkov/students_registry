class Subject < ActiveRecord::Base
  has_many :semester_subjects, :dependent => :destroy
  has_many :semesters,         :through   => :semester_subjects
  has_many :marks,             :dependent => :destroy

  scope :by_semester, ->(semester_id) { joins(:semester_subjects).where(:semester_subjects => { :semester_id => semester_id }) }
end
