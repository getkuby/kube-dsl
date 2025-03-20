# typed: strict

module KubeDSL
  module DSL
    module V1
      class FCVolumeSource < ::KubeDSL::DSLObject
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

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
        def fs_type(val = nil); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(T.nilable(Integer)) }
        def lun(val = nil); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
        def read_only(val = nil); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
        def target_ww_ns(val = nil); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
        def wwids(val = nil); end
      end
    end
  end
end