module KubeDSL::DSL::Policy::V1beta1
  class IDRange
    extend ::KubeDSL::ValueFields

    value_fields :max, :min

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:max] = max
        result[:min] = min
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :id_range
    end
  end
end
