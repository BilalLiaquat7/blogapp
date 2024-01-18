require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) do
        get '/users/1/posts'
      end
    it 'returns http success for posts#index action' do
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Here will be a list of posts for a given user.')
    end
  end

  describe 'GET /show' do
    before(:example) do
        get '/users/1/posts/1'
      end
    it 'returns a specific post for posts#show action' do
      expect(response).to be_successful
      expect(response).to render_template(:show)
      expect(response.body).to include('Here will be a specific post for a given user.')
    end
  end
end