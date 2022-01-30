# typed: strict

module KubeDSL::DSL::V1
  class DownwardAPIVolumeSource < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def default_mode(val = nil); end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::DownwardAPIVolumeFile))
      ).returns(T::Array[KubeDSL::DSL::V1::DownwardAPIVolumeFile])
    }
    def items(elem_name = nil, &block); end

  end
end
