Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'  # Update this to the domain of your React app if needed
    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
