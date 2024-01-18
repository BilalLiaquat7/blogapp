require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:example) do
      get '/users'
    end
    it 'returns http success for users#index action' do
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Here will be a list of users.')
    end
  end

  describe 'GET /show' do
    before(:example) do
      get '/users/1'
    end
    it 'returns a specific user for users#show action' do
      expect(response).to be_successful
      expect(response).to render_template(:show)
      expect(response.body).to include('specific user.')
    end
  end
end