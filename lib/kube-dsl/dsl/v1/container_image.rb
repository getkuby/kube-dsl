module KubeDSL::DSL::V1
  class ContainerImage < ::KubeDSL::DSLObject
    value_fields :size_bytes
    array_field :name

    def serialize
      {}.tap do |result|
        result[:sizeBytes] = size_bytes
        result[:names] = names
      end
    end

    def kind_sym
      :container_image
    end
  end
end
