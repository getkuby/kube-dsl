# typed: strict

module KubeDSL::DSL::V1
  class DownwardAPIVolumeFile < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { returns(KubeDSL::DSL::V1::ObjectFieldSelector) }
    def field_ref; end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def mode(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def path(val = nil); end

    sig { returns(KubeDSL::DSL::V1::ResourceFieldSelector) }
    def resource_field_ref; end

  end
end
