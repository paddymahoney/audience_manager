require 'spec_helper'

describe AudienceManager::Trait do

  describe 'attributes' do
    let(:trait) { AudienceManager::Trait.new }
    attributes = [:sid, :trait_type, :name, :description,
                  :status, :data_source_id, :folder_id]
    attributes.each do |attribute|
      it "has a #{attribute}" do
        expect(trait).to respond_to(attribute)
      end
    end
  end

  describe '.all(options={})' do
    context 'without options' do
      let(:traits) do
        VCR.use_cassette('AAM/trait/all') do
          AudienceManager::Trait.all
        end
      end
      it 'return an array with all traits' do
        expect(traits).to be_an(Array)
      end

      it 'return a array of traits' do
        expect(traits.first).to be_a(AudienceManager::Trait)
      end
    end
  end

  describe '.find(sid)' do
    context 'when found it' do
      let(:trait) do
        VCR.use_cassette('AAM/trait/find.357590') do
          AudienceManager::Trait.find(357_590)
        end
      end

      it 'return a trait' do
        expect(trait).to be_a(AudienceManager::Trait)
      end

      it 'fill trait attributes' do
        requested_attributes = {
          sid: 357_590,
          trait_type: nil,
          name: 'Video Type-fullepisode',
          description: 'Video Type-fullepisode',
          status: nil,
          data_source_id: nil,
          folder_id: nil
        }

        attributes = [:sid, :trait_type, :name, :description,
                      :status, :data_source_id, :folder_id]
        attributes.each do |attribute|
          expect(
            trait.public_send(attribute)
          ).to eq(requested_attributes[attribute])
        end
      end
    end
  end

end
