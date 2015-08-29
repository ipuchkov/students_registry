require 'rails_helper'

RSpec.describe Course, type: :model do
  it 'has number' do
    course = FactoryGirl.create(:course)
    expect(course.number).to eq(1)
  end
end
