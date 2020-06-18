module KubeDSL::DSL::Discovery::V1beta1
  class Endpoint < ::KubeDSL::DSLObject
    value_fields :addresses, :hostname
    object_field(:conditions) { KubeDSL::DSL::Discovery::V1beta1::EndpointConditions.new }
    object_field(:target_ref) { KubeDSL::DSL::V1::ObjectReference.new }
    key_value_field(:topology, format: :string)

    def serialize
      {}.tap do |result|
        result[:addresses] = addresses
        result[:hostname] = hostname
        result[:conditions] = conditions.serialize
        result[:targetRef] = target_ref.serialize
        result[:topology] = topology.serialize
      end
    end

    def kind_sym
      :endpoint
    end
  end
end
