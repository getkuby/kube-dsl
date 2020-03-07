module KubeDSL::DSL::V1
  class NodeAddress < ::KubeDSL::DSLObject
    value_fields :address, :type

    def serialize
      {}.tap do |result|
        result[:address] = address
        result[:type] = type
      end
    end

    def kind_sym
      :node_address
    end
  end
end
