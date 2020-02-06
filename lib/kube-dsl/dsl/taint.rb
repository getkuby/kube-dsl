module KubeDSL::DSL
  class Taint
    extend ::KubeDSL::ValueFields
    value_fields :effect, :key, :time_added, :value

    def serialize
      {}.tap do |result|
        result[:effect] = effect
        result[:key] = key
        result[:timeAdded] = time_added
        result[:value] = value
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
