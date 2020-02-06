module KubeDSL::DSL::Autoscaling
  class Scale
    extend ::KubeDSL::ValueFields

    object_field(:metadata) { KubeDSL::DSL::Meta::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Autoscaling::ScaleSpec.new }
    object_field(:status) { KubeDSL::DSL::Autoscaling::ScaleStatus.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "autoscaling/v1"
        result[:kind] = "Scale"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :scale
    end
  end
end
