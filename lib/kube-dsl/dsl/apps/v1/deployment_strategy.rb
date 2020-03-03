module KubeDSL::DSL::Apps::V1
  class DeploymentStrategy < ::KubeDSL::DSLObject
    value_fields :type
    object_field(:rolling_update) { KubeDSL::DSL::Apps::V1::RollingUpdateDeployment.new }

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
