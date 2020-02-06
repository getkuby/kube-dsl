module KubeDSL::DSL::Apps
  class ReplicaSetSpec
    extend ::KubeDSL::ValueFields

    value_fields :min_ready_seconds, :replicas
    object_field(:selector) { KubeDSL::DSL::Meta::LabelSelector.new }
    object_field(:template) { KubeDSL::DSL::PodTemplateSpec.new }

    def serialize
      {}.tap do |result|
        result[:minReadySeconds] = min_ready_seconds
        result[:replicas] = replicas
        result[:selector] = selector.serialize
        result[:template] = template.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :replica_set_spec
    end
  end
end
