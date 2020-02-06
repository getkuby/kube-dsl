module KubeDSL::DSL
  class ResourceRequirements
    extend ::KubeDSL::ValueFields

    object_field(:limits) { ::KubeDSL::KeyValueFields.new(format: :string) }
    object_field(:requests) { ::KubeDSL::KeyValueFields.new(format: :string) }

    def serialize
      {}.tap do |result|
        result[:limits] = limits.serialize
        result[:requests] = requests.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :resource_requirements
    end
  end
end
