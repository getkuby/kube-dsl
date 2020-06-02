module KubeDSL::DSL::Extensions::V1beta1
  class RuntimeClassStrategyOptions < ::KubeDSL::DSLObject
    value_fields :allowed_runtime_class_names, :default_runtime_class_name

    def serialize
      {}.tap do |result|
        result[:allowedRuntimeClassNames] = allowed_runtime_class_names
        result[:defaultRuntimeClassName] = default_runtime_class_name
      end
    end

    def kind_sym
      :runtime_class_strategy_options
    end
  end
end
