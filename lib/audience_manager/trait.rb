require 'virtus'
module AudienceManager
  class Trait
    include Virtus.model
    
    attribute :sid, Integer
    attribute :trait_type, String
    attribute :name, String
    attribute :description, String
    attribute :status, String
    attribute :data_source_id, Integer
    attribute :folder_id, Integer
    
    
    def self.all(options={})
      response = connection.get('/v1/traits')
      objects = JSON.parse(response.body)
      objects.map {|o| new o }
    end
    
    private
    def self.connection
      @connection ||= AudienceManager::API::Client.new
    end
    
  end
end
