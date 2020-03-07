module KubeDSL::DSL::Extensions::V1beta1
  class SELinuxStrategyOptions < ::KubeDSL::DSLObject
    value_fields :rule
    object_field(:se_linux_options) { KubeDSL::DSL::V1::SELinuxOptions.new }

    def serialize
      {}.tap do |result|
        result[:rule] = rule
        result[:seLinuxOptions] = se_linux_options.serialize
      end
    end

    def kind_sym
      :se_linux_strategy_options
    end
  end
end
