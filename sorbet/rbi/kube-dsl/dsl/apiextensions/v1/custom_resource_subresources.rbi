# typed: strict

module KubeDSL
  module DSL
    module Apiextensions
      module V1
        class CustomResourceSubresources < ::KubeDSL::DSLObject
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

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Apiextensions::V1::CustomResourceSubresourceScale) }
          def scale; end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def scale_present?; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def status(val = nil); end
        end
      end
    end
  end
end