module KubeDSL::DSL::V1
  class ContainerImage
    extend ::KubeDSL::ValueFields

    value_fields :size_bytes
    array_field :name

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:sizeBytes] = size_bytes
        result[:names] = names
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :container_image
    end
  end
end
