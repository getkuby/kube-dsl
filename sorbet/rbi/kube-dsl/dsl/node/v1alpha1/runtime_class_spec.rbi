# typed: strict

module KubeDSL
  module DSL
    module Node
      module V1alpha1
        class RuntimeClassSpec < ::KubeDSL::DSLObject
          T::Sig::WithoutRuntime.sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          T::Sig::WithoutRuntime.sig { returns(Symbol) }
          def kind_sym; end

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Node::V1alpha1::Overhead) }
          def overhead; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def runtime_handler(val = nil); end

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Node::V1alpha1::Scheduling) }
          def scheduling; end
        end
      end
    end
  end
end