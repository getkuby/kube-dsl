# typed: true

module KubeDSL
  module DSL
    module Authentication
      module V1
        class BoundObjectReference < ::KubeDSL::DSLObject
          value_field :api_version
          value_field :kind
          value_field :name
          value_field :uid

          validates :api_version, field: { format: :string }, presence: false
          validates :kind, field: { format: :string }, presence: false
          validates :name, field: { format: :string }, presence: false
          validates :uid, field: { format: :string }, presence: false

          def serialize
            {}.tap do |result|
              result[:apiVersion] = api_version
              result[:kind] = kind
              result[:name] = name
              result[:uid] = uid
            end
          end

          def kind_sym
            :bound_object_reference
          end
        end
      end
    end
  end
end