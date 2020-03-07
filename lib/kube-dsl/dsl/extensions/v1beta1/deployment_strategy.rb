module KubeDSL::DSL::Extensions::V1beta1
  class DeploymentStrategy < ::KubeDSL::DSLObject
    value_fields :type
    object_field(:rolling_update) { KubeDSL::DSL::Extensions::V1beta1::RollingUpdateDeployment.new }

    def serialize
      {}.tap do |result|
        result[:type] = type
        result[:rollingUpdate] = rolling_update.serialize
      end
    end

    def kind_sym
      :deployment_strategy
    end
  end
end
