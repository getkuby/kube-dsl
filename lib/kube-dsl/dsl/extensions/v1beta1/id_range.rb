module KubeDSL::DSL::Extensions::V1beta1
  class IDRange < ::KubeDSL::DSLObject
    value_fields :max, :min

    def serialize
      {}.tap do |result|
        result[:max] = max
        result[:min] = min
      end
    end

    def kind
      :id_range
    end
  end
end
