# frozen_string_literal: true

# require 'spec_helper'
# require './lesson6/car'
# require './lesson6/car_cargo'

RSpec.describe CarCargo, type: :model do
  context 'when class attr_reader && initializer works' do
    subject { described_class }

    car = described_class.new('0', 100)
    it { is_expected.to eq described_class }

    it 'attr_reader type exists && type works' do
      expect(car.type).to eq(Car::TYPES[0])
    end

    it 'attr_reader/reader method volume' do
      expect(car.volume).to eq(100)
    end

    it '#take_volume' do
      car.take_volume
      expect(car.volume_occupied).to eq(1)
    end

    it '#free_volume' do
      expect(car.volume_free).to eq(99)
    end
  end
end
