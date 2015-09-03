class Student < ActiveRecord::Base
  belongs_to :group
  has_one    :course,        :through   => :group
  has_many   :semesters,     :through   => :group
  has_many   :subjects,      :through   => :group
  has_many   :marks,         :dependent => :destroy
  has_many   :average_marks, :dependent => :destroy

  scope :ordered, -> { order(:surname, :name) }

  # топ 10 студентов курса в семестре
  scope :top, ->(number) do
    includes(:course, :group, :average_marks => [:semester]).
      where(:semesters => { :number => number }).
      order('average_marks.value desc, students.surname, students.name').limit(10)
  end

  # студенты с одинаковым ip адресом и как минимум одной характеристикой преподавателя
  scope :duplicate_ip_with_characteristic, -> do
    where("ip in (
          SELECT ip FROM students
          GROUP BY ip
          HAVING count(ip) > 1 AND count(characteristic) > 0)").
      order('ip')
  end

  # однокурсники с средним баллом между min и max в семестре и с именем name
  scope :for_search, ->(course_id, semester_number, min, max, name) do
    includes(:course, :average_marks => [:semester]).
      where(:courses => { :id => course_id }, :semesters => { :number => semester_number }).
      where("average_marks.value BETWEEN #{min} AND #{max}").
      where("LOWER(students.name) LIKE LOWER('#{name}%')")
  end

  normalize_attribute :email

  validates_presence_of :name, :surname, :email, :group_id
  validates_uniqueness_of :email

  def fullname
    [surname, name].join(' ')
  end

  # оценка по предмету в семестре
  def mark_for(semester_id, subject_id)
    marks.by_semester_and_subject(semester_id, subject_id).first
  end

  # средний балл в семестре
  def average_mark_for(semester_id)
    average_marks.find_by(:semester_id => semester_id)
  end
end
