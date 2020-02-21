module KubeDSL::DSL::V1
  class NodeAddress
    extend ::KubeDSL::ValueFields

    value_fields :address, :type

    def initialize(&block)
      instance_eval(&block) if block
    end

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
