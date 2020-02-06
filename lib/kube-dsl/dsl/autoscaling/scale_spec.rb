module KubeDSL::DSL::Autoscaling
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

    def kind
      :scale_spec
    end
  end
end
