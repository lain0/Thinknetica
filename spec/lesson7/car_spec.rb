# frozen_string_literal: true

# require 'spec_helper'
# require './lesson6/car'

RSpec.describe Car, type: :model do
  context 'when class attr_reader && initializer works' do
    subject { described_class }

    car = described_class.new('123', 'Passenger')

    it { is_expected.to eq described_class }

    it 'car is instance on Car' do
      expect(car).to be_an_instance_of(described_class)
    end

    it 'name is String' do
      expect(car.instance_variable_get(:@number).class).to eq(String)
    end

    it 'attr_reader type exists && type works' do
      expect(car.type).to eq('Passenger')
    end
  end
end
