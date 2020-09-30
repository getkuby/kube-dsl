module KubeDSL::DSL::Discovery::V1beta1
  class Endpoint < ::KubeDSL::DSLObject
    value_field :addresses
    object_field(:conditions) { KubeDSL::DSL::Discovery::V1beta1::EndpointConditions.new }
    value_field :hostname
    object_field(:target_ref) { KubeDSL::DSL::V1::ObjectReference.new }
    key_value_field(:topology, format: :string)

    validates :addresses, field: { format: :string }, presence: false
    validates :conditions, object: { kind_of: KubeDSL::DSL::Discovery::V1beta1::EndpointConditions }
    validates :hostname, field: { format: :string }, presence: false
    validates :target_ref, object: { kind_of: KubeDSL::DSL::V1::ObjectReference }
    validates :topology, kv: { value_format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:addresses] = addresses
        result[:conditions] = conditions.serialize
        result[:hostname] = hostname
        result[:targetRef] = target_ref.serialize
        result[:topology] = topology.serialize
      end
    end

    def kind_sym
      :endpoint
    end
  end
end
