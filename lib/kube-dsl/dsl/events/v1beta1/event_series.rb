# typed: true

module KubeDSL::DSL::Events::V1beta1
  class EventSeries < ::KubeDSL::DSLObject
    value_field :count
    value_field :last_observed_time

    validates :count, field: { format: :integer }, presence: false
    validates :last_observed_time, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:count] = count
        result[:lastObservedTime] = last_observed_time
      end
    end

    def kind_sym
      :event_series
    end
  end
end
