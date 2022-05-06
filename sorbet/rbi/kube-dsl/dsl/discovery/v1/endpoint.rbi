# typed: strict

module KubeDSL
  module DSL
    module Discovery
      module V1
        class Endpoint < ::KubeDSL::DSLObject
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

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Discovery::V1::EndpointConditions) }
          def conditions; end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
          def deprecated_topology(&block); end

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Discovery::V1::EndpointHints) }
          def hints; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def hostname(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def node_name(val = nil); end

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::ObjectReference) }
          def target_ref; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def zone(val = nil); end
        end
      end
    end
  end
end