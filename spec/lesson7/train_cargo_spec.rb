# frozen_string_literal: true

# require 'spec_helper'
# require './lesson6/train'
# require './lesson6/train_cargo'

RSpec.describe TrainCargo, type: :model do
  context 'when class attr_reader && initializer works' do
    subject { described_class }

    it { is_expected.to eq described_class }

    it 'attr_reader type exists && type works' do
      train = described_class.new('123-45')
      expect(train.type).to eq(Train::TYPES[0])
    end
  end
end
