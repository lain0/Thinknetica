# frozen_string_literal: true

# require 'spec_helper'

RSpec.describe CarPassenger, type: :model do
  context 'class attr_reader && initializer works' do
    subject { described_class }
    it { is_expected.to eq CarPassenger }

    it 'attr_reader type exists && type works' do
      car = CarPassenger.new(0)
      expect(car.type).to eq(Passenger::TYPE)
    end
  end
end
