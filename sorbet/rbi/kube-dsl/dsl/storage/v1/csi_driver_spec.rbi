# typed: strict

module KubeDSL::DSL::Storage::V1
  class CSIDriverSpec < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def attach_required(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def fs_group_policy(val = nil); end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def pod_info_on_mount(val = nil); end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def requires_republish(val = nil); end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def storage_capacity(val = nil); end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::Storage::V1::TokenRequest))
      ).returns(T::Array[KubeDSL::DSL::Storage::V1::TokenRequest])
    }
    def token_requests(elem_name = nil, &block); end

    sig { params(val: T.nilable(String)).returns(String) }
    def volume_lifecycle_modes(val = nil); end

  end
end
