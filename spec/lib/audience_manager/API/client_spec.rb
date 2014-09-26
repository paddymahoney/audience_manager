require 'spec_helper'

describe AudienceManager::API::Client do

  let(:client) { AudienceManager::API::Client.new }

  describe '.get(path)' do
    context 'successfull response' do
      let(:response) do
        VCR.use_cassette('AAM/api/client/get') do
          client.get('/v1/traits')
        end
      end
      it 'return a response from requested path' do
        expect(response).to be_a_kind_of(OAuth2::Response)
      end
      it 'return status code 200' do
        expect(response.status).to eq(200)
      end
    end
  end
end
