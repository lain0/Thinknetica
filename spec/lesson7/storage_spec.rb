# frozen_string_literal: true

# require 'spec_helper'
# require './lesson6/storage'

RSpec.describe Storage, type: :model do
  context 'when class attr_reader && initializer works' do
    subject { described_class }

    it "#{described_class}.instance_methods should include method #list" do
      expect((described_class.instance_methods - Class.methods)
        .to_set).to be_superset([:list].to_set)
    end

    it 'must return 3 puts' do
      # p output(described_class.new.list).to_stdout.include?('All Routes')
      # expect(described_class.new.list).to be_truthy
      # expect($stdout.gets.strip).to eq('All')
      # expect(STDOUT.should_receive(:puts).include?('All Trains')).to be_truthy
      # expect(output(described_class.new.list).to_stdout.include?('All Routes')).to be_truthy

      # expect(described_class.new.list.include?('All Routes')).to be_truthy
    end
  end
end
