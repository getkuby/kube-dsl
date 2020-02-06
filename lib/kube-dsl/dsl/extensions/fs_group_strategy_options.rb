module KubeDSL::DSL::Extensions
  class FSGroupStrategyOptions
    extend ::KubeDSL::ValueFields
    value_fields :rule
    array_field(:range) { KubeDSL::DSL::Extensions::IDRange.new }

    def serialize
      {}.tap do |result|
        result[:rule] = rule
        result[:ranges] = ranges.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
