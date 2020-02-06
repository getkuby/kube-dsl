module KubeDSL::DSL::Apps
  class DeploymentStrategy
    extend ::KubeDSL::ValueFields
    value_fields :type
    object_field(:rolling_update) { KubeDSL::DSL::Apps::RollingUpdateDeployment.new }

    def serialize
      {}.tap do |result|
        result[:type] = type
        result[:rollingUpdate] = rolling_update.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
