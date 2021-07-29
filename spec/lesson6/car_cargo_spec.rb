# frozen_string_literal: true

# require 'spec_helper'
require './lesson6/car'
require './lesson6/car_cargo'

RSpec.describe CarCargo, type: :model do
  context 'when class attr_reader && initializer works' do
    subject { described_class }

    it { is_expected.to eq described_class }

    it 'attr_reader type exists && type works' do
      car = described_class.new('0')
      expect(car.type).to eq(Car::TYPES[0])
    end
  end
end
