require 'rails_helper'

RSpec.describe DoctorsController, type: :controller do
  context 'GET #index' do
    it 'returns a redirect (not signed in)' do
      get :index
      expect(response).to redirect_to("/")
    end
  end
end
