# frozen_string_literal: true

# require 'spec_helper'

RSpec.describe Train, type: :model do
  context 'when class attr_reader && initializer works' do
    subject { described_class }

    it { is_expected.to eq described_class }
    # it 'is valid with valid attributes' do
    #   expect(Train.new(0, 'passanger')).to be_valid
    # end

    it 'attr_reader number works' do
      train = described_class.new(0, 'passanger')
      expect(train.number).to eq(0)
    end

    it 'type is valid' do
      train = described_class.new(0, 'passanger')
      expect(train.type).to eq('passanger')
    end

    it 'speed should eq 0 ' do
      train = described_class.new(0, 'passanger')
      expect(train.speed).to eq(0)
    end

    it 'station should eq nil by default && attr_reader works' do
      train = described_class.new(0, 'passanger')
      expect(train.station).to eq(nil)
    end
  end
end
