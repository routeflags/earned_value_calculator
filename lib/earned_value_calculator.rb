# frozen_string_literal: true

require_relative "earned_value_calculator/version"
require_relative "earned_value_calculator/validator"
require "business_time"

##
# This module represents a project metric with Earned Value Management.
module EarnedValueCalculator
  ##
  # This class calculates the earned value of a project.
  class << self
    include ActiveModel::Validations

    attr_accessor :project_length,
                  :current_length,
                  :budget,
                  :rate,
                  :actual_cost,
                  # It is based on the formula:
                  #   EV = BAC × Actual complete %
                  :earned_value,
                  # @return [Integer] The value.
                  # It is based on the formula:
                  #   SV = EV - PV
                  :schedule_variance,
                  :planned_value,
                  # It is based on the formula:
                  #   CV = EV - AC
                  :actual_cost_variance,
                  # It is based on the formula:
                  #   CPI = EV ÷ AC
                  :cost_performance_index,
                  # It is based on the formula:
                  #   SPI = EV ÷ PV
                  :schedule_performance_index

    # @param [Date] start_date The project start date.
    # @param [Date] end_date The project deadline.
    # @param [Date] current_date The current date.
    # @param [Integer] budget The Budget At Completion of the project.
    # @param [Integer] rate The actual rate of progression.
    # @param [Integer] actual_cost The actual full actual_cost of the project.
    # @return [EarnedValueCalculator] The object.
    def call(start_date, end_date, current_date, budget, rate, actual_cost)
      validator = EarnedValueCalculator::Validator
                  .new(start_date, end_date, current_date, budget, rate, actual_cost)
      raise ArgumentError, validator.errors.messages unless validator.valid?

      @project_length = (start_date..end_date).select(&:workday?).size
      @current_length = (start_date..current_date).select(&:workday?).size
      @budget = budget
      @rate = rate
      @actual_cost = actual_cost
      calculate_earned_values
      self
    end

    def calculate_earned_values
      @earned_value = (@budget * (@rate.to_f / 100)).to_i
      @planned_value = (@budget * @current_length / @project_length.to_f).to_i
      @schedule_variance = @planned_value - @earned_value
      @actual_cost_variance = @actual_cost - @earned_value
      @cost_performance_index = @earned_value.to_f / @actual_cost
      @schedule_performance_index = @earned_value.to_f / @planned_value
    end
  end
end
