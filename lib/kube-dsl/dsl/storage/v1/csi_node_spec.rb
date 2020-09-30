module KubeDSL::DSL::Storage::V1
  class CSINodeSpec < ::KubeDSL::DSLObject
    array_field(:driver) { KubeDSL::DSL::Storage::V1::CSINodeDriver.new }

    validates :drivers, array: { kind_of: KubeDSL::DSL::Storage::V1::CSINodeDriver }, presence: false

    def serialize
      {}.tap do |result|
        result[:drivers] = drivers.map(&:serialize)
      end
    end

    def kind_sym
      :csi_node_spec
    end
  end
end
