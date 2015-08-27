class Mark < ActiveRecord::Base
  belongs_to :semester
  belongs_to :subject
  belongs_to :student

  scope :by_semester,             ->(semester_id) { joins(:semester).where(:semesters => { :id => semester_id }) }
  scope :by_subject,              ->(subject_id)  { joins(:subject).where(:subjects => { :id => subject_id }) }
  scope :by_semester_and_subject, ->(semester_id, subject_id) { joins(:semester, :subject).where(:semesters => { :id => semester_id }, :subjects => { :id => subject_id }) }
end
