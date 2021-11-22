require 'rails_helper'

RSpec.describe '/deals', type: :request do
  login_user

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_deal_url
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Deal' do
        expect do
          post deals_url,
               params: { deal: FactoryBot.attributes_for(:deal, category_ids: [FactoryBot.create(:category).id]) }
        end.to change(Deal, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new deal' do
        expect do
          post deals_url, params: { deal: FactoryBot.attributes_for(:deal, name: nil) }
        end.to change(Deal, :count).by(0)
      end

      it "renders new page (i.e. to display the 'new' template)" do
        post deals_url, params: { deal: FactoryBot.attributes_for(:deal, name: nil) }
        expect(response).not_to be_successful
      end
    end
  end
end
