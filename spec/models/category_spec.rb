require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validates' do
    subject { FactoryBot.build :category }

    it 'should have a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should not have an empty name' do
      subject.name = ' '
      expect(subject).to_not be_valid
    end

    it 'should have name not longer than 100 chars' do
      subject.name = 'a' * 101
      expect(subject).to_not be_valid
    end

    it 'should have an icon' do
      subject.icon = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'association' do
    subject { FactoryBot.build :category }

    it 'should have a user' do
      expect(subject.user).to be_present
    end
  end
end
