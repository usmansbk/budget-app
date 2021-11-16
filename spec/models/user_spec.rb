require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validates' do
    subject { FactoryBot.build :user }

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

    it 'should have an email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'association' do
    context 'has-many categories' do
      subject { FactoryBot.build(:user_with_categories, categories_count: 3) }

      it 'should have categories' do
        expect(subject.categories.length).to be 3
      end
    end

    context 'has-many deals' do
      subject { FactoryBot.build(:user_with_deals, deals_count: 3) }

      it 'should have deals' do
        expect(subject.deals.length).to be 3
      end
    end
  end
end
