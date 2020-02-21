module KubeDSL::DSL::Extensions::V1beta1
  class SELinuxStrategyOptions
    extend ::KubeDSL::ValueFields

    value_fields :rule
    object_field(:se_linux_options) { KubeDSL::DSL::V1::SELinuxOptions.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:rule] = rule
        result[:seLinuxOptions] = se_linux_options.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :se_linux_strategy_options
    end
  end
end
