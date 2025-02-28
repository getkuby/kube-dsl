# typed: strict

module KubeDSL
  module DSL
    module Node
      module V1beta1
        class RuntimeClass < ::KubeDSL::DSLObject
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


          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def handler(val = nil); end


          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Meta::V1::ObjectMeta).void)).returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def metadata_present?; end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Node::V1beta1::Overhead).void)).returns(KubeDSL::DSL::Node::V1beta1::Overhead) }
          def overhead(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def overhead_present?; end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Node::V1beta1::Scheduling).void)).returns(KubeDSL::DSL::Node::V1beta1::Scheduling) }
          def scheduling(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def scheduling_present?; end
        end
      end
    end
  end
end