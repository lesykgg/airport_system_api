describe API::V1::FlightsController, type: :controller do
  let!(:flight1) { FactoryBot.create(:flight, from: 'Kyiv', destination: 'Munich') }
  let!(:flight2) { FactoryBot.create(:flight, from: 'Lviv', destination: 'Munich') }

  describe 'GET #index' do
    it 'applies filters' do
      request.headers.merge(valid_auth_headers)

      get :index, params: { from: 'Lviv' }

      expect(response).to have_http_status :ok
    end
  end
end
