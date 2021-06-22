# frozen_string_literal: true

# require 'spec_helper'

RSpec.describe CarCargo, type: :model do
  context 'class attr_reader && initializer works' do
    subject { described_class }
    it { is_expected.to eq CarCargo }

    it 'attr_reader type exists && type works' do
      car = CarCargo.new(0)
      expect(car.type).to eq(Cargo::TYPE)
    end
  end
end
