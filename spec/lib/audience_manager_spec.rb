require 'spec_helper'

describe AudienceManager do
  describe '#configure' do
    let(:client_id) { 'xpto001' }
    let(:client_secret) { 'Df$r5fg%ggh6' }
    before do
      AudienceManager.configure do |config|
        config.client_id     = client_id
        config.client_secret = client_secret
      end
    end

    it 'sets the configuration properties' do
      expect(AudienceManager.configuration.client_id).to eq(client_id)
      expect(AudienceManager.configuration.client_secret).to eq(client_secret)
    end
  end
end