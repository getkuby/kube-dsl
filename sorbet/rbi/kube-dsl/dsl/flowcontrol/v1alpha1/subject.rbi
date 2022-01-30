# typed: strict

module KubeDSL::DSL::Flowcontrol::V1alpha1
  class Subject < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { returns(KubeDSL::DSL::Flowcontrol::V1alpha1::GroupSubject) }
    def group; end

    sig { params(val: T.nilable(String)).returns(String) }
    def kind(val = nil); end

    sig { returns(KubeDSL::DSL::Flowcontrol::V1alpha1::ServiceAccountSubject) }
    def service_account; end

    sig { returns(KubeDSL::DSL::Flowcontrol::V1alpha1::UserSubject) }
    def user; end

  end
end
