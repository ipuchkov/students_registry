class Group < ActiveRecord::Base
  belongs_to :course
  has_many   :students,  :dependent => :destroy
  has_many   :semesters, :dependent => :destroy
  has_many   :subjects,  :through   => :semesters
end
