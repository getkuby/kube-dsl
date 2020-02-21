module KubeDSL::DSL::Storage::V1
  class CSINodeSpec
    extend ::KubeDSL::ValueFields

    array_field(:driver) { KubeDSL::DSL::Storage::V1::CSINodeDriver.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:drivers] = drivers.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :csi_node_spec
    end
  end
end
