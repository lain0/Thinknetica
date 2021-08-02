# frozen_string_literal: true

# require 'spec_helper'
# require './lesson7/car'
# require './lesson7/car_passenger'

RSpec.describe CarPassenger, type: :model do
  context 'when class attr_reader && initializer works' do
    subject { described_class }

    it { is_expected.to eq described_class }

    it 'attr_reader type exists && type works' do
      car = described_class.new('0')
      expect(car.type).to eq(Car::TYPES[1])
    end
    it "#{described_class}.instance_methods should include methods #take_seat" do
      expect((described_class.instance_methods - Class.methods).to_set).to be_superset([:take_seat].to_set)
      # .respond_to?(:take_seat)
    end
  end
end
