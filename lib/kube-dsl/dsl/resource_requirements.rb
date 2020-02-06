module KubeDSL::DSL
  class ResourceRequirements
    extend ::KubeDSL::ValueFields
    object_field(:limits) { ::KubeDSL::KeyValueFields.new }
    object_field(:requests) { ::KubeDSL::KeyValueFields.new }

    def serialize
      {}.tap do |result|
        result[:limits] = limits.serialize
        result[:requests] = requests.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
