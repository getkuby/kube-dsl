module KubeDSL::DSL::Policy::V1beta1
  class IDRange < ::KubeDSL::DSLObject
    value_fields :max, :min

    def serialize
      {}.tap do |result|
        result[:max] = max
        result[:min] = min
      end
    end

    def kind_sym
      :id_range
    end
  end
end
