class Course < ActiveRecord::Base
  has_many :groups,    :dependent => :destroy
  has_many :semesters, :through   => :groups

  scope :ordered, -> { order('number asc') }

  def available_semester_numbers
    semesters.select('number').uniq.order('number').map(&:number)
  end

  def human_number
    "#{number} курс"
  end
end
