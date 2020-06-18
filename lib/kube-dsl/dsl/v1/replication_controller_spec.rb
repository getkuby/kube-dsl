module KubeDSL::DSL::V1
  class ReplicationControllerSpec < ::KubeDSL::DSLObject
    value_fields :min_ready_seconds, :replicas
    object_field(:template) { KubeDSL::DSL::V1::PodTemplateSpec.new }
    key_value_field(:selector, format: :string)

    def serialize
      {}.tap do |result|
        result[:minReadySeconds] = min_ready_seconds
        result[:replicas] = replicas
        result[:template] = template.serialize
        result[:selector] = selector.serialize
      end
    end

    def kind_sym
      :replication_controller_spec
    end
  end
end
