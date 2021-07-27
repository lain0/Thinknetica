# frozen_string_literal: true

# require 'spec_helper'
require './lesson6/train'

RSpec.describe Train, type: :model do
  context 'when class attr_reader && initializer works' do
    subject { described_class }

    let(:train) { described_class.new('NU4-123', 'Passenger') }

    it { is_expected.to eq described_class }

    it 'train is instance on Train' do
      expect(train).to be_an_instance_of(described_class)
    end

    it 'attr_reader number works' do
      expect(train.number).to eq('NU4-123')
    end

    it 'type is exec Passenger' do
      expect(train.type).to eq('Passenger')
    end

    it 'type is String' do
      expect(train.type.class).to eq(String)
    end

    it 'type is included in ' do
      expect(described_class::TYPES.include?(train.type)).to be_truthy
    end
    it 'speed should eq 0 ' do
      expect(train.speed).to eq(0)
    end

    it 'station should eq nil by default && attr_reader works' do
      expect(train.station).to eq(nil)
    end

  end

  context 'when Validation number and type valid? true' do
    # subject { described_class }
    let(:train) { described_class.new('NU4-123', 'Passenger') }

    describe '#valid?' do
      it 'returns true' do
        # expect(Train.new('123').valid?).to eq(true)
        expect(train.valid?).to be_truthy
      end
    end
    describe '#validate!' do
      it 'returns true' do
        # expect(Train.new('123').valid?).to eq(true)
        expect(train.valid?).to be_truthy
      end
    end
  end

  context 'when Validation number or type are valid? false' do
    # subject { described_class }
    # let(:train) { Train.new('NU-123', '') }
    describe '#valid?' do
      it 'returns false' do
        # expect(Train.new('NU4-123','InValidType').valid?).to be_falsy
        expect(described_class.new('', 'Passenger').valid?).to be_falsy
        expect(described_class.new('NU4-123', '').valid?).to be_falsy
        #let(:train) { Train.new('NU-123', '') }
        # expect(train.valid?).to be_falsy
      end
    end
    describe '#validate!' do
      it 'fails when number type is empty' do
        expect(described_class.new('NU4-123', '')).to be_falsy
      end
      it 'fails when type is wrong' do
        # expect(Train.new('123').valid?).to eq(true)
        # expect(train.valid?).to be_falsy
        expect(described_class.new('NU4-123', 'InValidType')).to raise_error
      end
      it 'fails when number is empty' do
        expect(described_class.new('', 'Passenger')).to be_falsy
      end
      it 'fails when number format is wrong' do
        expect(described_class.new('123', 'Passenger')).to be_falsy
      end
    end
  end
end
