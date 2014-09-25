require 'oauth2'

module AudienceManager
  module API
    class Client    
      def initialize(config = AudienceManager.configuration)
        @config = config
      end
    
      def get(path)
        token.get(path)
      end  

      private

      def client
        @token ||= OAuth2::Client.new(
          @config.client_id,
          @config.client_secret,
          :site => 'https://api.demdex.com'
        )
      end
  
      def token
        @token ||= client.password.get_token(@config.user, @config.password)
      end
    end
  end
end