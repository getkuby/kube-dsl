# typed: strict

module KubeDSL
  module DSL
    module Flowcontrol
      module V1beta1
        class FlowSchema < ::KubeDSL::DSLObject
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



          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def metadata_present?; end

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Flowcontrol::V1beta1::FlowSchemaSpec) }
          def spec; end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def spec_present?; end

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Flowcontrol::V1beta1::FlowSchemaStatus) }
          def status; end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def status_present?; end
        end
      end
    end
  end
end