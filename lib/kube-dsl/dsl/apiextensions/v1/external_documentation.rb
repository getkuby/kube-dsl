# typed: true

module KubeDSL
  module DSL
    module Apiextensions
      module V1
        class ExternalDocumentation < ::KubeDSL::DSLObject
          value_field :description
          value_field :url

          validates :description, field: { format: :string }, presence: false
          validates :url, field: { format: :string }, presence: false

          def serialize
            {}.tap do |result|
              result[:description] = description
              result[:url] = url
            end
          end

          def kind_sym
            :external_documentation
          end
        end
      end
    end
  end
end