require 'rails_helper'

RSpec.describe '/categories', type: :request do
  login_user

  describe 'GET /index' do
    it 'renders a successful response' do
      FactoryBot.create(:category, user: @user)
      get categories_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      category = FactoryBot.create(:category, user: @user)
      get category_url(category)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_category_url
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Category' do
        expect do
          post categories_url, params: { category: FactoryBot.attributes_for(:category, user: @user) }
        end.to change(Category, :count).by(1)
      end

      it 'redirects to the created category' do
        post categories_url, params: { category: FactoryBot.attributes_for(:category, user: @user) }
        expect(response).to redirect_to(category_url(Category.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Category' do
        expect do
          post categories_url, params: { category: FactoryBot.attributes_for(:category, user: @user) }
        end.to change(Category, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post categories_url, params: { category: FactoryBot.attributes_for(:category, user: @user) }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested category' do
      category = FactoryBot.create(:category, user: @user)
      expect do
        delete category_url(category)
      end.to change(Category, :count).by(-1)
    end

    it 'redirects to the categories list' do
      category = FactoryBot.create(:category, user: @user)
      delete category_url(category)
      expect(response).to redirect_to(categories_url)
    end
  end
end
