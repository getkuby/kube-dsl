module KubeDSL::DSL::Storage::V1beta1
  class CSINodeSpec < ::KubeDSL::DSLObject
    array_field(:driver) { KubeDSL::DSL::Storage::V1beta1::CSINodeDriver.new }

    def serialize
      {}.tap do |result|
        result[:drivers] = drivers.map(&:serialize)
      end
    end

    def kind
      :csi_node_spec
    end
  end
end
