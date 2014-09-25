require 'spec_helper'

describe AudienceManager::Trait do
  
  describe 'attributes' do
    let(:trait) { AudienceManager::Trait.new }
    [:sid, :trait_type, :name, :description, :status, :data_source_id, :folder_id].each do |attribute|
      it "has a #{attribute}" do
        expect(trait).to respond_to(attribute)
      end
    end
  end
  
  describe '.all(options={})' do
    context 'without options' do
      let(:traits) { 
        VCR.use_cassette('AAM/trait/all') do
          AudienceManager::Trait.all
        end
      }
      it 'return an array with all traits' do
        expect(traits).to be_an(Array)
      end
      
      it 'return a array of traits' do
        expect(traits.first).to be_a(AudienceManager::Trait)
      end
    end
  end
end