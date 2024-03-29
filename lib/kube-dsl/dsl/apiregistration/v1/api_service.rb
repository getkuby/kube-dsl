# typed: true

module KubeDSL
  module DSL
    module Apiregistration
      module V1
        class APIService < ::KubeDSL::DSLObject
          object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
          object_field(:spec) { KubeDSL::DSL::Apiregistration::V1::APIServiceSpec.new }
          object_field(:status) { KubeDSL::DSL::Apiregistration::V1::APIServiceStatus.new }

          validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
          validates :spec, object: { kind_of: KubeDSL::DSL::Apiregistration::V1::APIServiceSpec }
          validates :status, object: { kind_of: KubeDSL::DSL::Apiregistration::V1::APIServiceStatus }

          def serialize
            {}.tap do |result|
              result[:apiVersion] = "apiregistration.k8s.io/v1"
              result[:kind] = "APIService"
              result[:metadata] = metadata.serialize
              result[:spec] = spec.serialize
              result[:status] = status.serialize
            end
          end

          def kind_sym
            :api_service
          end
        end
      end
    end
  end
end