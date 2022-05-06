# typed: strict

module KubeDSL
  module DSL
    module V1
      class DownwardAPIVolumeSource < ::KubeDSL::DSLObject
        T::Sig::WithoutRuntime.sig {
          returns(
            T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
          )
        }
        def serialize; end

        T::Sig::WithoutRuntime.sig { returns(Symbol) }
        def kind_sym; end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
        def default_mode(val = nil); end

        T::Sig::WithoutRuntime.sig {
          params(
            elem_name: T.nilable(Symbol),
            block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::DownwardAPIVolumeFile))
          ).returns(T::Array[KubeDSL::DSL::V1::DownwardAPIVolumeFile])
        }
        def items(elem_name = nil, &block); end
      end
    end
  end
end