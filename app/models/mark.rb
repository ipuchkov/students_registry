class Mark < ActiveRecord::Base
  belongs_to :semester
  belongs_to :subject
  belongs_to :student

  scope :by_semester, ->(id) do
    joins(:semester).where(:semesters => { :id => id })
  end
  scope :by_subject, ->(id) do
    joins(:subject).where(:subjects => { :id => id })
  end
  scope :by_semester_and_subject, ->(semester_id, subject_id) do
    by_semester(semester_id).by_subject(subject_id)
  end

  after_create  :increase_average_mark
  after_destroy :decrease_average_mark

  private

  [:increase, :decrease].each do |action|
    define_method "#{action}_average_mark" do
      AverageMarkCalculator.new(self, action).set_mark_value
    end
  end
end
