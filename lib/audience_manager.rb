require "audience_manager/version"
require "audience_manager/configuration"

module AudienceManager
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
