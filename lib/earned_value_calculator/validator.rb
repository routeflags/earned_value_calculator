# frozen_string_literal: true

require "date"
require "active_model"

module EarnedValueCalculator
  class Validator
    include ActiveModel::Validations

    attr_accessor :start_date, :end_date, :current_date, :budget, :rate, :actual_cost

    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :current_date, presence: true
    validates :budget, presence: true
    validates :rate, presence: true
    validates :actual_cost, presence: true
    validate :un_permit_format

    # @param [Date] start_date The project start date.
    # @param [Date] end_date The project deadline.
    # @param [Date] current_date The current date.
    # @param [Integer] budget The Budget At Completion of the project.
    # @param [Integer] rate The actual rate of progression.
    # @param [Integer] actual_cost The actual full actual_cost of the project.
    def initialize(start_date, end_date, current_date, budget, rate, actual_cost)
      self.start_date = start_date
      self.end_date = end_date
      self.current_date = current_date
      self.budget = budget
      self.rate = rate
      self.actual_cost = actual_cost

      raise ArgumentError, errors.messages unless valid?
    end

    private

    def un_permit_format
      %i[start_date end_date current_date].map do |x|
        errors.add(x, "Allow only DateTime format") unless public_send(x).is_a?(Date)
      end
      %i[budget rate actual_cost].map do |x|
        errors.add(x, "Allow only Integer format") unless public_send(x).is_a?(Integer)
      end
    end
  end
end
