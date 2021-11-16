require 'rails_helper'

RSpec.describe Deal, type: :model do
  describe 'validates' do
    subject { FactoryBot.build :deal }

    it 'should have a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should not have an empty name' do
      subject.name = ' '
      expect(subject).to_not be_valid
    end

    it 'should have an amount' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end

    it 'should have an amount greater than 0' do
      subject.amount = 0
      expect(subject).to_not be_valid
    end
  end

  describe 'author' do
    subject { FactoryBot.build :deal }

    it 'should have an author' do
      expect(subject.author).to be_present
    end
  end
end
