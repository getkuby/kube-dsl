module KubeDSL::DSL::Storage
  class CSINodeSpec
    extend ::KubeDSL::ValueFields
    array_field(:driver) { KubeDSL::DSL::Storage::CSINodeDriver.new }

    def serialize
      {}.tap do |result|
        result[:drivers] = drivers.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
