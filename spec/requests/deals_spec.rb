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
      it 'redirects to the created deal' do
        post deals_url, params: { deal: FactoryBot.create(:deal) }
        expect(response).to redirect_to(deal_url(Deal.last))
      end
    end
  end
end
