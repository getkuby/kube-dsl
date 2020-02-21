module KubeDSL::DSL::V1
  class EndpointAddress
    extend ::KubeDSL::ValueFields

    value_fields :hostname, :ip, :node_name
    object_field(:target_ref) { KubeDSL::DSL::V1::ObjectReference.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

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

    def kind
      :endpoint_address
    end
  end
end
