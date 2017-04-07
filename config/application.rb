require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ChatSpace
  class Application < Rails::Application
    config.i18n.default_locale = :ja #コメントアウトしている場合は外すだけで良い。
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
  end
end
