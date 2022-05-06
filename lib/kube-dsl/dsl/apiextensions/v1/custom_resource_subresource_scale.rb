# typed: true

module KubeDSL
  module DSL
    module Apiextensions
      module V1
        class CustomResourceSubresourceScale < ::KubeDSL::DSLObject
          value_field :label_selector_path
          value_field :spec_replicas_path
          value_field :status_replicas_path

          validates :label_selector_path, field: { format: :string }, presence: false
          validates :spec_replicas_path, field: { format: :string }, presence: false
          validates :status_replicas_path, field: { format: :string }, presence: false

          def serialize
            {}.tap do |result|
              result[:labelSelectorPath] = label_selector_path
              result[:specReplicasPath] = spec_replicas_path
              result[:statusReplicasPath] = status_replicas_path
            end
          end

          def kind_sym
            :custom_resource_subresource_scale
          end
        end
      end
    end
  end
end