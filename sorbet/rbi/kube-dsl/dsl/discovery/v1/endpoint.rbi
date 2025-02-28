# typed: strict

module KubeDSL
  module DSL
    module Discovery
      module V1
        class Endpoint < ::KubeDSL::DSLObject
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
          def addresses(val = nil); end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Discovery::V1::EndpointConditions).void)).returns(KubeDSL::DSL::Discovery::V1::EndpointConditions) }
          def conditions(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def conditions_present?; end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(::KubeDSL::KeyValueFields).void)).returns(::KubeDSL::KeyValueFields) }
          def deprecated_topology(&block); end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Discovery::V1::EndpointHints).void)).returns(KubeDSL::DSL::Discovery::V1::EndpointHints) }
          def hints(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def hints_present?; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def hostname(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def node_name(val = nil); end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::ObjectReference).void)).returns(KubeDSL::DSL::V1::ObjectReference) }
          def target_ref(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def target_ref_present?; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def zone(val = nil); end
        end
      end
    end
  end
end