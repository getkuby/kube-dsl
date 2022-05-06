# typed: true

module KubeDSL
  module DSL
    module V1
      class ResourceRequirements < ::KubeDSL::DSLObject
        key_value_field(:limits, format: :string)
        key_value_field(:requests, format: :string)

        validates :limits, kv: { value_format: :string }, presence: false
        validates :requests, kv: { value_format: :string }, presence: false

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
  end
end