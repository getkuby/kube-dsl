# typed: strict

module KubeDSL
  module DSL
    module Policy
      module V1
        class Eviction < ::KubeDSL::DSLObject
          object_field(:delete_options) { KubeDSL::DSL::Meta::V1::DeleteOptions.new }
          object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }

          validates :delete_options, object: { kind_of: KubeDSL::DSL::Meta::V1::DeleteOptions }
          validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }

          def serialize
            {}.tap do |result|
              result[:apiVersion] = "policy/v1"
              result[:deleteOptions] = delete_options.serialize
              result[:kind] = "Eviction"
              result[:metadata] = metadata.serialize
            end
          end

          def kind_sym
            :eviction
          end
        end
      end
    end
  end
end