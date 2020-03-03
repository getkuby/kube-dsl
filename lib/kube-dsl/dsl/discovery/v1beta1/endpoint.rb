module KubeDSL::DSL::Discovery::V1beta1
  class Endpoint < ::KubeDSL::DSLObject
    value_fields :hostname
    array_field :address
    object_field(:conditions) { KubeDSL::DSL::Discovery::V1beta1::EndpointConditions.new }
    object_field(:target_ref) { KubeDSL::DSL::V1::ObjectReference.new }
    object_field(:topology) { ::KubeDSL::KeyValueFields.new(format: :string) }

    def serialize
      {}.tap do |result|
        result[:hostname] = hostname
        result[:addresses] = addresses
        result[:conditions] = conditions.serialize
        result[:targetRef] = target_ref.serialize
        result[:topology] = topology.serialize
      end
    end

    def kind
      :endpoint
    end
  end
end
