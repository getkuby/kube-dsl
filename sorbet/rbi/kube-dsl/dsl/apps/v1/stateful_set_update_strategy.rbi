# typed: strict

module KubeDSL
  module DSL
    module Apps
      module V1
        class StatefulSetUpdateStrategy < ::KubeDSL::DSLObject
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

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Apps::V1::RollingUpdateStatefulSetStrategy).void)).returns(KubeDSL::DSL::Apps::V1::RollingUpdateStatefulSetStrategy) }
          def rolling_update(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def rolling_update_present?; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def type(val = nil); end
        end
      end
    end
  end
end