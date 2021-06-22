# frozen_string_literal: true

# require 'spec_helper'

RSpec.describe Car, type: :model do
  context 'class attr_reader && initializer works' do
    subject { described_class }
    it { is_expected.to eq Car }

    it 'attr_reader type exists && type works' do
      car = Car.new(0, 'passanger')
      expect(car.type).to eq('passanger')
    end
  end
end
