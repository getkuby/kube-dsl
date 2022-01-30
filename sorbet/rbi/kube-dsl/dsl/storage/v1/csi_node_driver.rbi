# typed: strict

module KubeDSL::DSL::Storage::V1
  class CSINodeDriver < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { returns(KubeDSL::DSL::Storage::V1::VolumeNodeResources) }
    def allocatable; end

    sig { params(val: T.nilable(String)).returns(String) }
    def name(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def node_id(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def topology_keys(val = nil); end

  end
end
