module KubeDSL::DSL::V1
  class ResourceRequirements < ::KubeDSL::DSLObject
    object_field(:limits) { ::KubeDSL::KeyValueFields.new(format: :string) }
    object_field(:requests) { ::KubeDSL::KeyValueFields.new(format: :string) }

    def serialize
      {}.tap do |result|
        result[:limits] = limits.serialize
        result[:requests] = requests.serialize
      end
    end

    def kind_sym
      :resource_requirements
    end
  end
end
