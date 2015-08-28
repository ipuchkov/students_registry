# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'
require 'populator'

subjects = Subject.create([{:title => 'Русский язык'}, {:title => 'Информатика'}, {:title => 'Математика'}, {:title => 'Физика'}, {:title => 'Химия'}, {:title => 'Мат.анализ'}])

4.times {|c| Course.create(:number => c+1)}

Course.find_each do |course|
  Group.populate(1..3) do |g|
    g.number    = Faker::Number.hexadecimal(3)
    g.course_id = course.id
  end
end

Group.find_each do |g|
  4.times do |i|
    semester = g.semesters.create(:number => i + 1)
    semester.subjects << subjects
  end

  Student.populate(1..5) do |student|
    student.group_id          = g.id
    student.name              = Faker::Name.first_name
    student.surname           = Faker::Name.last_name
    student.email             = Faker::Internet.email
    student.ip                = Faker::Internet.ip_v4_address
    student.birthdate         = Faker::Time.between(DateTime.now - 20.years, DateTime.now - 10.years).to_date
    student.registration_time = Faker::Time.between(DateTime.now - 10.days, DateTime.now)
    student.characteristic    = Random.rand(0..1).zero? ? Faker::Lorem.sentence(5) : nil
  end
end

Student.find_each do |student|
  student.semesters.each do |semester|
    Subject.by_semester(semester.id).each do |subject|
      student.marks.create(:semester_id => semester.id, :subject_id => subject.id, :value => Faker::Number.between(3,5))
    end
  end
end
