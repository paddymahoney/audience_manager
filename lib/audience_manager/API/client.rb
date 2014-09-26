require 'oauth2'

module AudienceManager
  module API
    # The AudienceManager::API::Client class
    class Client
      def initialize(config = AudienceManager.configuration)
        @config = config
      end

      def get(path)
        token.get(path)
      end

      private

      def client
        @client ||= OAuth2::Client.new(
          @config.client_id,
          @config.client_secret,
          site: 'https://api.demdex.com'
        )
      end

      def token
        return new_token unless @token
        refresh_token if @token.expired?
        @token
      end

      def new_token
        @token = client.password.get_token(@config.user, @config.password)
      end

      def refresh_token
        @token.refresh!
      end
    end
  end
end
