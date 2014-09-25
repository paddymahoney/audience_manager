require 'spec_helper'

describe AudienceManager::Client do
  before(:all) do
    AudienceManager.configure do |config|
      config.client_id     = ENV['AAM_CLIENT_ID']
      config.client_secret = ENV['AAM_CLIENT_SECRET']
      config.user          = ENV['AAM_USER']
      config.password      = ENV['AAM_PASSWORD']
    end
  end
  
  let(:client) { AudienceManager::Client.new }

  describe '.get(path)' do
    context 'successfull response' do
      let(:response) { 
        VCR.use_cassette('AAM/client/get') do
           client.get('/v1/traits') 
        end
      }
      it 'return a response from requested path' do
        expect(response).to be_a_kind_of(OAuth2::Response)
      end
      it 'return status code 200' do
        expect(response.status).to eq(200)
      end
    end
  end
end