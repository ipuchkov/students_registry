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
end
