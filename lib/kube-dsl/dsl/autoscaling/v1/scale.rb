module KubeDSL::DSL::Autoscaling::V1
  class Scale < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Autoscaling::V1::ScaleSpec.new }
    object_field(:status) { KubeDSL::DSL::Autoscaling::V1::ScaleStatus.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "autoscaling/v1"
        result[:kind] = "Scale"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def kind
      :scale
    end
  end
end
