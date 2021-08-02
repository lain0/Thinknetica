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
      expect(described_class::TYPES).to include(train.type)
    end

    it 'speed should eq 0 ' do
      expect(train.speed).to eq(0)
    end

    it 'station should eq nil by default && attr_reader works' do
      expect(train.station).to eq(nil)
    end

    it "#{described_class}.instance_methods should include methods #valid?" do
      expect((described_class.instance_methods - Class.methods).to_set).to be_superset([:valid?].to_set)
    end

    it "#{described_class}.instance_methods should include methods #validate! #validate_type #validate_number" do
      expect((described_class.private_instance_methods - Class.methods)
        .to_set).to be_superset(%i[validate! validate_number validate_type].to_set)
    end
  end

  context 'when #valid? number and type' do
    # subject { described_class }
    let(:train) { described_class.new('NU4-123', 'Passenger') }

    it '#valid? && validate! returns true' do
      expect(train).to be_valid
    end
  end

  context 'when Invalid' do
    describe '#valid?' do
      let(:train) { described_class.new('NU4-123', 'Passenger') }

      it 'false if number not valid?' do
        train.instance_variable_set(:@number, '123')
        expect(train).not_to be_valid
      end

      it 'false if type not valid?' do
        train.instance_variable_set(:@type, 'WrongType')
        expect(train).not_to be_valid
      end
    end

    describe '#validate!' do
      it 'fails when type is empty' do
        expect { described_class.new('NU4-123', '') }
          .to raise_error(RuntimeError)
      end

      it 'fails when type is wrong' do
        expect { described_class.new('NU4-123', 'InValidType') }
          .to raise_error(RuntimeError)
      end

      it 'fails when number is empty' do
        expect { described_class.new('', 'Passenger') }.to raise_error(RuntimeError)
      end

      it 'fails when number format is wrong' do
        expect { described_class.new('123', 'Passenger') }.to raise_error(RuntimeError)
      end
    end
  end
end
