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

  describe "#calculates" do
    { project_length: 5,
      current_length: 2,
      budget: 100,
      rate: 10,
      actual_cost: 1,
      earned_value: 10,
      schedule_variance: -30,
      planned_value: 40,
      actual_cost_variance: 9,
      cost_performance_index: 10.0,
      schedule_performance_index: 0.25,
      estimate_at_completion: 7.0,
      estimate_to_completion: 6.0,
      variance_at_completion: 93.0 }.each do |symbol, integer|
      [
        { label: "has a valid value with #{symbol}",
          input: [Date.today - 3, Date.today + 3, Date.today, 100, 10, 1],
          outcome: integer }
      ].each do |test|
        context test[:label] do
          subject { EarnedValueCalculator.call(*test[:input]).public_send(symbol) }
          it { is_expected.to be test[:outcome] }
        end
      end
    end
  end
end
