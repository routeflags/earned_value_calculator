# frozen_string_literal: true
require "date"
require "earned_value_calculator"

RSpec.describe EarnedValueCalculator do
  it "has a version number" do
    expect(EarnedValueCalculator::VERSION).not_to be nil
  end

  [
    { label: "raises an error",
      input: [1, 1, 1, 1, 1, 1],
      outcome: :raise_error }
  ].each do |test|
    subject { -> { EarnedValueCalculator.call(*test[:input]) } }
    it test[:label] do
      expect { subject.call }.to public_send(test[:outcome])
    end
  end

  describe "#calculate" do
    [
      { label: "has a valid calculate with earned_value",
        input: [Date.today - 3, Date.today + 3, Date.today, 100, 10, 1],
        outcome: 10 }
    ].each do |test|
      context test[:label] do
        subject { EarnedValueCalculator.call(*test[:input]).earned_value }
        it { is_expected.to be test[:outcome] }
      end
    end
  end
end
