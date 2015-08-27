class Student < ActiveRecord::Base
  belongs_to :group
  has_many   :semesters, :through   => :group
  has_many   :subjects,  :through   => :group
  has_many   :marks,     :dependent => :destroy

  scope :ordered, -> { order(:surname, :name) }
end
