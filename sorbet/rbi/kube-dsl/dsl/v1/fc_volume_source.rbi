# typed: strict

module KubeDSL
  module DSL
    module V1
      class FCVolumeSource < ::KubeDSL::DSLObject
        sig {
          returns(
            T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
          )
        }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def fs_type(val = nil); end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def lun(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def read_only(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def target_ww_ns(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def wwids(val = nil); end
      end
    end
  end
end