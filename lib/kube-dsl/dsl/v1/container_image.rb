module KubeDSL::DSL::V1
  class ContainerImage < ::KubeDSL::DSLObject
    value_fields :names, :size_bytes

    def serialize
      {}.tap do |result|
        result[:names] = names
        result[:sizeBytes] = size_bytes
      end
    end

    def kind_sym
      :container_image
    end
  end
end
