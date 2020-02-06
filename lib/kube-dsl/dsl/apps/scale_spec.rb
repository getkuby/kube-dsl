module KubeDSL::DSL::Apps
  class ScaleSpec
    extend ::KubeDSL::ValueFields
    value_fields :replicas

    def serialize
      {}.tap do |result|
        result[:replicas] = replicas
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
