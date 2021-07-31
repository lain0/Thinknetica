# frozen_string_literal: true

# require 'spec_helper'
require './lesson6/station'

RSpec.describe Station, type: :model do
  context 'when class attr_reader && initializer works' do
    subject { described_class }

    let(:station) { described_class.new('Leningrad') }

    it { is_expected.to eq described_class }

    it 'station is instance on Station' do
      expect(station).to be_an_instance_of(described_class)
    end

    it 'attr_reader name works' do
      expect(station.name).to eq('Leningrad')
    end

    it 'name is String' do
      expect(station.name.class).to eq(String)
    end

    it "#{described_class}.instance_methods should include methods #valid?" do
      expect((described_class.instance_methods - Class.methods).to_set).to be_superset([:valid?].to_set)
    end

    it "#{described_class}.instance_methods should include methods #validate! #validate_type #validate_number" do
      expect((described_class.private_instance_methods - Class.methods)
        .to_set).to be_superset(%i[validate! validate_number validate_type validate_name].to_set)
    end
  end

  context 'when #valid? name' do
    # subject { described_class }
    let(:station) { described_class.new('Leningrad') }

    it '#valid? && #validate! returns true' do
      expect(station).to be_valid
    end
  end

  context 'when Invalid' do
    describe '#valid?' do
      let(:station) { described_class.new('Leningrad') }

      it 'false if name is blank?' do
        station.instance_variable_set(:@name, '')
        expect(station).not_to be_valid
      end

      it 'false if type not valid?' do
        station.instance_variable_set(:@name, '12345678901234567890123')
        expect(station).not_to be_valid
      end
    end

    describe '#validate!' do
      it 'fails when name is empty' do
        expect { described_class.new('') }
          .to raise_error(RuntimeError)
      end

      it 'fails when name is wrong length' do
        expect { described_class.new('12345678901234567890123') }
          .to raise_error(RuntimeError)
      end
    end
  end
end
