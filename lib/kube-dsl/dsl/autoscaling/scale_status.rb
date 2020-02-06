module KubeDSL::DSL::Autoscaling
  class ScaleStatus
    extend ::KubeDSL::ValueFields
    value_fields :replicas, :selector

    def serialize
      {}.tap do |result|
        result[:replicas] = replicas
        result[:selector] = selector
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
