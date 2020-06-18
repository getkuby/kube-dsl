module KubeDSL::DSL::V1
  class ResourceRequirements < ::KubeDSL::DSLObject
    key_value_field(:limits, format: :string)
    key_value_field(:requests, format: :string)

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
