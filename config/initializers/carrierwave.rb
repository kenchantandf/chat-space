CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    AWS_ACCESS_KEY_ID: ENV['AWS_ACCESS_KEY_ID'],
    AWS_SECRET_ACCESS_KEY: ENV['AWS_SECRET_ACCESS_KEY'],
    region: 'us-west-1'
  }

  case Rails.env
  when 'development'
    config.storage :fog
    config.fog_directory  = 'chat-space-expert'
    config.asset_host = 'https://s3-us-west-1.amazonaws.com/chat-space-expert'
  when 'production'
    config.storage :fog
    config.fog_directory  = 'chat-space-expert'
    config.asset_host = 'https://s3-us-west-1.amazonaws.com/chat-space-expert'
  when 'test'
    config.storage :file
  end

end
