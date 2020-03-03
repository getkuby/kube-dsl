module KubeDSL::DSL::Extensions::V1beta1
  class ReplicaSetSpec < ::KubeDSL::DSLObject
    value_fields :min_ready_seconds, :replicas
    object_field(:selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }
    object_field(:template) { KubeDSL::DSL::V1::PodTemplateSpec.new }

    def serialize
      {}.tap do |result|
        result[:minReadySeconds] = min_ready_seconds
        result[:replicas] = replicas
        result[:selector] = selector.serialize
        result[:template] = template.serialize
      end
    end

    def kind
      :replica_set_spec
    end
  end
end
