# typed: strict

module KubeDSL
  module DSL
    module Rbac
      module V1
        class ClusterRole < ::KubeDSL::DSLObject
          extend KubeDSL::ValueFields::ClassMethods
          extend KubeDSL::Validations::ClassMethods
          include KubeDSL::ValueFields::InstanceMethods

          T::Sig::WithoutRuntime.sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          T::Sig::WithoutRuntime.sig { returns(Symbol) }
          def kind_sym; end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Rbac::V1::AggregationRule).void)).returns(KubeDSL::DSL::Rbac::V1::AggregationRule) }
          def aggregation_rule(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def aggregation_rule_present?; end



          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Meta::V1::ObjectMeta).void)).returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def metadata_present?; end

          T::Sig::WithoutRuntime.sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Rbac::V1::PolicyRule))
            ).returns(T::Array[KubeDSL::DSL::Rbac::V1::PolicyRule])
          }
          def rules(elem_name = nil, &block); end
        end
      end
    end
  end
end