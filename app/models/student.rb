class Student < ActiveRecord::Base
  belongs_to :group
  has_one    :course,        :through   => :group
  has_many   :semesters,     :through   => :group
  has_many   :subjects,      :through   => :group
  has_many   :marks,         :dependent => :destroy
  has_many   :average_marks, :dependent => :destroy

  scope :ordered, -> { order(:surname, :name) }
  scope :top,     ->(course_id, semester_number) { includes(:course, :group, :average_marks => [:semester]).
                                                   where(:courses => { :id => course_id }, :semesters => { :number => semester_number }).
                                                   order('average_marks.value desc, students.surname, students.name') }

  normalize_attribute :email

  validates_presence_of :name, :surname, :email
  validates_uniqueness_of :email
end
