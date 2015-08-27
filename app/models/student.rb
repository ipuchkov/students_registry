class Student < ActiveRecord::Base
  belongs_to :group
  has_many   :semesters, :through   => :group
  has_many   :subjects,  :through   => :group
  has_many   :marks,     :dependent => :destroy

  scope :ordered, -> { order(:surname, :name) }

  normalize_attribute :email

  validates_presence_of :name, :surname, :email
  validates_uniqueness_of :email
end
