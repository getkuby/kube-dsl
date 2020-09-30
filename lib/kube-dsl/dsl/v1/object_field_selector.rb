module KubeDSL::DSL::V1
  class ObjectFieldSelector < ::KubeDSL::DSLObject
    value_field :api_version
    value_field :field_path

    validates :api_version, field: { format: :string }, presence: false
    validates :field_path, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:apiVersion] = api_version
        result[:fieldPath] = field_path
      end
    end

    def kind_sym
      :object_field_selector
    end
  end
end
