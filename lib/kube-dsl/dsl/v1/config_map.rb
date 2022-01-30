# typed: true

module KubeDSL::DSL::V1
  class ConfigMap < ::KubeDSL::DSLObject
    key_value_field(:binary_data, format: :byte)
    key_value_field(:data, format: :string)
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }

    validates :binary_data, kv: { value_format: :byte }, presence: false
    validates :data, kv: { value_format: :string }, presence: false
    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:binaryData] = binary_data.serialize
        result[:data] = data.serialize
        result[:kind] = "ConfigMap"
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :config_map
    end
  end
end
