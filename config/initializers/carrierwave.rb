CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['aws_access_key_id'],
    aws_secret_access_key: ENV['aws_secret_access_key'],
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
