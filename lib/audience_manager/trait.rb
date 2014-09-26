require 'virtus'
module AudienceManager
  # The AudienceManager::Trait class
  class Trait
    include Virtus.model

    attribute :sid, Integer
    attribute :trait_type, String
    attribute :name, String
    attribute :description, String
    attribute :status, String
    attribute :data_source_id, Integer
    attribute :folder_id, Integer

    def self.all(_options = {})
      response = connection.get('/v1/traits')
      objects = JSON.parse(response.body)
      objects.map { |from_hash| new from_hash }
    end

    def self.find(sid)
      return nil unless sid
      response = connection.get("/v1/traits/#{sid}")
      if response.status == 200
        from_hash = JSON.parse(response.body)
        new from_hash
      end
    end

    def self.connection
      @connection ||= AudienceManager::API::Client.new
    end
  end
end
