module KubeDSL::DSL::Discovery
  class Endpoint
    extend ::KubeDSL::ValueFields

    value_fields :hostname
    array_field :address
    object_field(:conditions) { KubeDSL::DSL::Discovery::EndpointConditions.new }
    object_field(:target_ref) { KubeDSL::DSL::ObjectReference.new }
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

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :endpoint
    end
  end
end
