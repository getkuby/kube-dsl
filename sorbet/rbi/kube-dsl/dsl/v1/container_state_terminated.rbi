# typed: strict

module KubeDSL::DSL::V1
  class ContainerStateTerminated < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(String)).returns(String) }
    def container_id(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def exit_code(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def finished_at(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def message(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def reason(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def signal(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def started_at(val = nil); end

  end
end
