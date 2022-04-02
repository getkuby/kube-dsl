# typed: strict

module KubeDSL
  module DSL
    module Storage
      module V1
        class StorageClass < ::KubeDSL::DSLObject
          sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def allow_volume_expansion(val = nil); end

          sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::TopologySelectorTerm))
            ).returns(T::Array[KubeDSL::DSL::V1::TopologySelectorTerm])
          }
          def allowed_topologies(elem_name = nil, &block); end



          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { params(val: T.nilable(String)).returns(String) }
          def mount_options(val = nil); end

          sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
          def parameters(&block); end

          sig { params(val: T.nilable(String)).returns(String) }
          def provisioner(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def reclaim_policy(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def volume_binding_mode(val = nil); end
        end
      end
    end
  end
end