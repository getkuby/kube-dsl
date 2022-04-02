# typed: strict

module KubeDSL
  class DSLObject
    extend T::Sig

    extend ::KubeDSL::ValueFields
    extend ::KubeDSL::Validations

    sig { params(block: T.nilable(T.proc.void)).void }
    def initialize(&block)
      instance_eval(&block) if block
    end

    sig { returns(::KubeDSL::Resource) }
    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    sig { returns(T.any(String, T::Array[T.untyped], T::Hash[T.untyped, T.untyped])) }
    def serialize
      raise NotImplementedError, "#{__method__} must be defined in subclasses"
    end
  end
end
