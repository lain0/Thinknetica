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

    it "#{described_class}.instance_methods should include methods #valid?" do
      expect((described_class.instance_methods - Class.methods).to_set.superset?([:valid?].to_set)).to be_truthy
    end

    it "#{described_class}.instance_methods should include methods #validate! #validate_type #validate_number" do
      expect((described_class.private_instance_methods - Class.methods)
        .to_set.superset?([:validate!, :validate_number, :validate_type].to_set)).to be_truthy
    end
  end

  context 'when #valid? number and type' do
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

  context 'when Invalid' do
    # subject { described_class }
    # let(:train) { Train.new('NU-123', '') }
    describe '#valid?' do
      let(:train) { described_class.new('NU4-123', 'Passenger') }

      it 'false if number not valid?' do
        train.instance_variable_set(:@number, '123')
        # expect(train.valid?).to be_falsy
        expect(train).not_to be_valid
      end

      it 'false if type not valid?' do
        train.instance_variable_set(:@type, 'WrongType')
        expect(train).not_to be_valid
      end
    end

    describe '#validate!' do
      it 'fails when type is empty' do
        -> { described_class.new('NU4-123', '') }
          .should raise_error(RuntimeError, "class Train initialize variable must include #{described_class::TYPES}")
      end

      it 'fails when type is wrong' do
        -> { described_class.new('NU4-123', 'InValidType') }
          .should raise_error(RuntimeError, "class Train initialize variableInValidType must include #{described_class::TYPES}")
      end

      it 'fails when number is empty' do
        -> { described_class.new('', 'Passenger') }.should raise_error(RuntimeError)
      end

      it 'fails when number format is wrong' do
        -> { described_class.new('123', 'Passenger') }.should raise_error(RuntimeError)
      end
    end
  end
end
