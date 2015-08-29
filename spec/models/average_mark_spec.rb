require 'rails_helper'

RSpec.describe AverageMark, type: :model do
  context 'value' do
    before(:each) do
      @student = FactoryGirl.create(:student)
      @semester = FactoryGirl.create(:semester, number: 1)
      @subjects = FactoryGirl.create_list(:subject, 3)
      @subjects.each do |sub|
        FactoryGirl.create(:mark, :excellent, subject: sub, student: @student, semester: @semester)
      end
      @average_mark = @student.average_marks.find_by(semester_id: @semester.id)
    end

    it 'should has value' do
      expect(@average_mark.value).to eq(5.0)
    end

    it 'should be value decreased' do
      sub = FactoryGirl.create(:subject, title: 'temp')
      FactoryGirl.create(:mark, value: 3, subject: sub, student: @student, semester: @semester)
      expect(@average_mark.reload.value).to eq((5+5+5+3)/4.0)
    end
  end
end
