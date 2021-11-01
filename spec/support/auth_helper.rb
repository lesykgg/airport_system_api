module AuthHelper
  def valid_auth_headers(user = FactoryBot.create(:user))
    headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }

    Devise::JWT::TestHelpers.auth_headers(headers, user)
  end
end

RSpec.configure do |config|
  config.include AuthHelper, type: :controller
end
