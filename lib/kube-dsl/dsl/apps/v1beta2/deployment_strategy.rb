module KubeDSL::DSL::Apps::V1beta2
  class DeploymentStrategy < ::KubeDSL::DSLObject
    value_fields :type
    object_field(:rolling_update) { KubeDSL::DSL::Apps::V1beta2::RollingUpdateDeployment.new }

    def serialize
      {}.tap do |result|
        result[:type] = type
        result[:rollingUpdate] = rolling_update.serialize
      end
    end

    def kind
      :deployment_strategy
    end
  end
end
