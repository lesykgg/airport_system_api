Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'localho.st', 'http://localhost:3000', 'http://localhost:5000', 'https://localhost:3000'
    resource '*', headers: :any, methods: [:get, :post, :patch, :put, :delete], credentials: true, expose: %w(Authorization), max_age: 600
  end
end
