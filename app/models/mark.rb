class Mark < ActiveRecord::Base
  belongs_to :semester
  belongs_to :subject
  belongs_to :student

  scope :by_semester,             ->(semester_id) { joins(:semester).where(:semesters => { :id => semester_id }) }
  scope :by_subject,              ->(subject_id)  { joins(:subject).where(:subjects => { :id => subject_id }) }
  scope :by_semester_and_subject, ->(semester_id, subject_id) { joins(:semester, :subject).where(:semesters => { :id => semester_id }, :subjects => { :id => subject_id }) }

  after_create  :increase_average_mark
  after_destroy :decrease_average_mark

  private

  [:increase, :decrease].each do |action|
    define_method "#{action}_average_mark" do
      AverageMarkCalculator.new(self, action).set_mark_value
    end
  end
end
