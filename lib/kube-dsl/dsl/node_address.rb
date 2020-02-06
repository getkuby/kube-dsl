module KubeDSL::DSL
  class NodeAddress
    extend ::KubeDSL::ValueFields

    value_fields :address, :type

    def serialize
      {}.tap do |result|
        result[:address] = address
        result[:type] = type
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :node_address
    end
  end
end
