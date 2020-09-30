module KubeDSL::DSL::V1
  class ObjectReference < ::KubeDSL::DSLObject
    value_field :api_version
    value_field :field_path
    value_field :kind
    value_field :name
    value_field :namespace
    value_field :resource_version
    value_field :uid

    validates :api_version, field: { format: :string }, presence: false
    validates :field_path, field: { format: :string }, presence: false
    validates :kind, field: { format: :string }, presence: false
    validates :name, field: { format: :string }, presence: false
    validates :namespace, field: { format: :string }, presence: false
    validates :resource_version, field: { format: :string }, presence: false
    validates :uid, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:apiVersion] = api_version
        result[:fieldPath] = field_path
        result[:kind] = kind
        result[:name] = name
        result[:namespace] = namespace
        result[:resourceVersion] = resource_version
        result[:uid] = uid
      end
    end

    def kind_sym
      :object_reference
    end
  end
end
