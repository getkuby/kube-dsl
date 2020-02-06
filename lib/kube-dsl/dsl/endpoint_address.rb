module KubeDSL::DSL
  class EndpointAddress
    extend ::KubeDSL::ValueFields
    value_fields :hostname, :ip, :node_name
    object_field(:target_ref) { KubeDSL::DSL::ObjectReference.new }

    def serialize
      {}.tap do |result|
        result[:hostname] = hostname
        result[:ip] = ip
        result[:nodeName] = node_name
        result[:targetRef] = target_ref.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
