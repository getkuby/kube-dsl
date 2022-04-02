# typed: true

module KubeDSL
  module DSL
    module V1
      class Secret < ::KubeDSL::DSLObject
        key_value_field(:data, format: :byte)
        value_field :immutable
        object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
        key_value_field(:string_data, format: :string)
        value_field :type

        validates :data, kv: { value_format: :byte }, presence: false
        validates :immutable, field: { format: :boolean }, presence: false
        validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
        validates :string_data, kv: { value_format: :string }, presence: false
        validates :type, field: { format: :string }, presence: false

        def serialize
          {}.tap do |result|
            result[:apiVersion] = "v1"
            result[:data] = data.serialize
            result[:immutable] = immutable
            result[:kind] = "Secret"
            result[:metadata] = metadata.serialize
            result[:stringData] = string_data.serialize
            result[:type] = type
          end
        end

        def kind_sym
          :secret
        end
      end
    end
  end
end