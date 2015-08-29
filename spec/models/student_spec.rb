require 'rails_helper'

RSpec.describe Student, type: :model do
  context 'fields' do
    before(:each) do
      @student = FactoryGirl.build(:student, email: 'winter@coming.is', name: 'Jon', surname: 'Snow', ip: '127.0.0.1', characteristic: 'Know nothing')
    end

    it 'should have email' do
      expect(@student.email).to eq('winter@coming.is')
    end

    it 'should have name' do
      expect(@student.name).to eq('Jon')
    end

    it 'should have surname' do
      expect(@student.surname).to eq('Snow')
    end

    it 'should have ip' do
      expect(@student.ip).to eq('127.0.0.1')
    end

    it 'should have characteristic' do
      expect(@student.characteristic).to eq('Know nothing')
    end
  end

  context 'top 10' do
    before(:each) do
      @course = FactoryGirl.create(:course)
      @group = FactoryGirl.create(:group, course: @course)
      @semester = FactoryGirl.create(:semester, group: @group)
      @student = FactoryGirl.create(:student, group: @group)
      @subjects = FactoryGirl.create_list(:subject, 4)
      @students = FactoryGirl.create_list(:student, 15, group: @group)
      @subjects.each do |sub|
        FactoryGirl.create(:mark, :excellent, semester: @semester, subject: sub, student: @student)
        @students.each do |student|
          FactoryGirl.create(:mark,  semester: @semester, subject: sub, student: student)
        end
      end
    end

    it 'should have top 10' do
      expect(@course.students.top(@semester.number).count).to eq(10)
    end

    it 'should have @student in top' do
      expect(@course.students.top(@semester.number).first).to eq(@student)
    end
  end

  context 'duplicate ip' do
    before(:each) do
      @student1 = FactoryGirl.create(:student, ip: '123', characteristic: '123')
      @student2 = FactoryGirl.create(:student, ip: '123', characteristic: nil)
      @student3 = FactoryGirl.create(:student, ip: '321', characteristic: nil)
      @student4 = FactoryGirl.create(:student, ip: '321', characteristic: nil)
    end

    it 'should have 2 students' do
      expect(Student.duplicate_ip_with_characteristic).to eq([@student1, @student2])
    end
  end

  context 'search' do
    before(:each) do
      @course1 = FactoryGirl.create(:course)
      @course2 = FactoryGirl.create(:course)
      @group1 = FactoryGirl.create(:group, course: @course1)
      @group2 = FactoryGirl.create(:group, course: @course2)
      @semester1 = FactoryGirl.create(:semester)
      @semester2 = FactoryGirl.create(:semester)
      @student0 = FactoryGirl.create(:student, group: @group1, name: 'Petyr')
      @student1 = FactoryGirl.create(:student, group: @group1, name: 'JonSnow')
      @student2 = FactoryGirl.create(:student, group: @group1, name: 'JonSnow')
      @student3 = FactoryGirl.create(:student, group: @group1, name: 'JonSnow')
      @student4 = FactoryGirl.create(:student, group: @group2, name: 'JonSnow')
      FactoryGirl.create(:average_mark, student: @student0, semester: @semester1, value: 4.5)
      FactoryGirl.create(:average_mark, student: @student1, semester: @semester1, value: 4.5)
      FactoryGirl.create(:average_mark, student: @student2, semester: @semester1, value: 3.0)
      FactoryGirl.create(:average_mark, student: @student3, semester: @semester2, value: 4.5)
      FactoryGirl.create(:average_mark, student: @student4, semester: @semester1, value: 4.5)
    end

    it 'should have @student1' do
      expect(Student.for_search(@course1.id, @semester1.number, 3.5, 5.0, 'JonSnow')).to eq([@student1])
    end
  end
end
