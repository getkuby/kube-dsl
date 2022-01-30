# typed: true

module KubeDSL::DSL::Policy::V1beta1
  class RuntimeClassStrategyOptions < ::KubeDSL::DSLObject
    value_field :allowed_runtime_class_names
    value_field :default_runtime_class_name

    validates :allowed_runtime_class_names, field: { format: :string }, presence: false
    validates :default_runtime_class_name, field: { format: :string }, presence: false

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
