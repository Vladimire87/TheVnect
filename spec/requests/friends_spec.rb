# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Friends', type: :request do
  describe 'GET /show' do
    it 'returns http success' do
      get '/friends/show'
      expect(response).to have_http_status(:success)
    end
  end
end
