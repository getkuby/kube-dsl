# typed: strict

module KubeDSL
  class DSLObject
    extend T::Sig

    extend ::KubeDSL::ValueFields
    extend ::KubeDSL::Validations

    T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(::KubeDSL::DSLObject).void)).void }
    def initialize(&block)
      instance_eval(&block) if block
    end

    T::Sig::WithoutRuntime.sig { returns(::KubeDSL::Resource) }
    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    T::Sig::WithoutRuntime.sig { returns(T.any(String, T::Array[T.untyped], T::Hash[T.untyped, T.untyped])) }
    def serialize
      raise NotImplementedError, "#{__method__} must be defined in subclasses"
    end
  end
end
