# typed: true

module KubeDSL::DSL::Extensions::V1beta1
  class ReplicaSetSpec < ::KubeDSL::DSLObject
    value_field :min_ready_seconds
    value_field :replicas
    object_field(:selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }
    object_field(:template) { KubeDSL::DSL::V1::PodTemplateSpec.new }

    validates :min_ready_seconds, field: { format: :integer }, presence: false
    validates :replicas, field: { format: :integer }, presence: false
    validates :selector, object: { kind_of: KubeDSL::DSL::Meta::V1::LabelSelector }
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
      :replica_set_spec
    end
  end
end
