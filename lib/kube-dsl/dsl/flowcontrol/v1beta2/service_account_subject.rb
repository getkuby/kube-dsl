# typed: true

module KubeDSL
  module DSL
    module Flowcontrol
      module V1beta2
        class ServiceAccountSubject < ::KubeDSL::DSLObject
          value_field :name
          value_field :namespace

          validates :name, field: { format: :string }, presence: false
          validates :namespace, field: { format: :string }, presence: false

          def serialize
            {}.tap do |result|
              result[:name] = name
              result[:namespace] = namespace
            end
          end

          def kind_sym
            :service_account_subject
          end
        end
      end
    end
  end
end