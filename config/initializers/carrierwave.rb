CarrierWave.configure do |config|
  config.cache_dir = Rails.root.join('tmp', 'uploads')
  # Use local storage if in development or test
  config.storage = :file if Rails.env.development? || Rails.env.test?
end
