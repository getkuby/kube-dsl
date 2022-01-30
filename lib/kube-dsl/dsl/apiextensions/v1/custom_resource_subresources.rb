# typed: true

module KubeDSL::DSL::Apiextensions::V1
  class CustomResourceSubresources < ::KubeDSL::DSLObject
    object_field(:scale) { KubeDSL::DSL::Apiextensions::V1::CustomResourceSubresourceScale.new }
    value_field :status

    validates :scale, object: { kind_of: KubeDSL::DSL::Apiextensions::V1::CustomResourceSubresourceScale }
    validates :status, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:scale] = scale.serialize
        result[:status] = status
      end
    end

    def kind_sym
      :custom_resource_subresources
    end
  end
end
