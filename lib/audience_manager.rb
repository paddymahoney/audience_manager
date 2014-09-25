require "audience_manager/version"
require "audience_manager/api/configuration"
require "audience_manager/api/client"

module AudienceManager
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= self::API::Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
