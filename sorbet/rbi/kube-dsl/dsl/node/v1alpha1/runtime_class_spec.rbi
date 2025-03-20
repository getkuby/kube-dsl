# typed: strict

module KubeDSL
  module DSL
    module Node
      module V1alpha1
        class RuntimeClassSpec < ::KubeDSL::DSLObject
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

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Node::V1alpha1::Overhead).void)).returns(KubeDSL::DSL::Node::V1alpha1::Overhead) }
          def overhead(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def overhead_present?; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
          def runtime_handler(val = nil); end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Node::V1alpha1::Scheduling).void)).returns(KubeDSL::DSL::Node::V1alpha1::Scheduling) }
          def scheduling(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def scheduling_present?; end
        end
      end
    end
  end
end