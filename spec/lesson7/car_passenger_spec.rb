# frozen_string_literal: true

# require 'spec_helper'
# require './lesson7/car'
# require './lesson7/car_passenger'

RSpec.describe CarPassenger, type: :model do
  context 'when class attr_reader && initializer works' do
    subject { described_class }

    car = described_class.new('0', 123)

    it { is_expected.to eq described_class }

    it 'attr_reader type' do
      expect(car.type).to eq(Car::TYPES[1])
    end

    it 'attr_reader seats' do
      expect(car.seats).to eq(123)
    end

    it 'include methods: #take_seat #free_seats' do
      expect((described_class.instance_methods - Class.methods).to_set).to be_superset(%i[take_seat seats_free
                                                                                          seats_occupied].to_set)
      # expect(described_class.instance_methods.respond_to?(:take_seat)).to be_truthy
    end

    it '#take_seat' do
      car.take_seat
      expect(car.seats_occupied).to eq(1)
    end

    it '#free_seats' do
      expect(car.seats_free).to eq(122)
    end
  end
end
