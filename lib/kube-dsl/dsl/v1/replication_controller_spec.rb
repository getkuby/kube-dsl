# typed: true

module KubeDSL::DSL::V1
  class ReplicationControllerSpec < ::KubeDSL::DSLObject
    value_field :min_ready_seconds
    value_field :replicas
    key_value_field(:selector, format: :string)
    object_field(:template) { KubeDSL::DSL::V1::PodTemplateSpec.new }

    validates :min_ready_seconds, field: { format: :integer }, presence: false
    validates :replicas, field: { format: :integer }, presence: false
    validates :selector, kv: { value_format: :string }, presence: false
    validates :template, object: { kind_of: KubeDSL::DSL::V1::PodTemplateSpec }

    def serialize
      {}.tap do |result|
        result[:minReadySeconds] = min_ready_seconds
        result[:replicas] = replicas
        result[:selector] = selector.serialize
        result[:template] = template.serialize
      end
    end

    def kind_sym
      :replication_controller_spec
    end
  end
end
