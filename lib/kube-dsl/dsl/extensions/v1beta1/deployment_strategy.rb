module KubeDSL::DSL::Extensions::V1beta1
  class DeploymentStrategy
    extend ::KubeDSL::ValueFields

    value_fields :type
    object_field(:rolling_update) { KubeDSL::DSL::Extensions::V1beta1::RollingUpdateDeployment.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:type] = type
        result[:rollingUpdate] = rolling_update.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :deployment_strategy
    end
  end
end
