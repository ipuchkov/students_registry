require 'rails_helper'

RSpec.describe Group, type: :model do
  context 'assosiations' do
    before(:each) do
      @course = FactoryGirl.create(:course)
      @group = FactoryGirl.create(:group, course: @course)
    end

    it 'belogs to course' do
      expect(@group.course).to eq(@course)
    end

    it 'has students' do
      student = FactoryGirl.create(:student, group: @group)
      expect(student.group).to eq(@group)
    end
  end

  context 'fields' do
    it 'has number' do
      group = FactoryGirl.create(:group, number: 'a1')
      expect(group.number).to eq('a1')
    end
  end
end
