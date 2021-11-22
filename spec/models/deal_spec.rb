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

    it 'should have name not longer than 100 chars' do
      subject.name = 'a' * 101
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

  describe 'association' do
    context 'belong-to author' do
      subject { FactoryBot.build :deal }

      it 'should have an author' do
        expect(subject.author).to be_present
      end
    end

    context 'has-many categories' do
      subject { FactoryBot.build :deal_with_categories, categories_count: 5 }

      it 'should have deals' do
        expect(subject.categories.length).to be 5
      end
    end
  end
end
