# typed: strict

module KubeDSL::DSL::V1
  class ContainerStatus < ::KubeDSL::DSLObject
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

    sig { params(val: T.nilable(String)).returns(String) }
    def image(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def image_id(val = nil); end

    sig { returns(KubeDSL::DSL::V1::ContainerState) }
    def last_state; end

    sig { params(val: T.nilable(String)).returns(String) }
    def name(val = nil); end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def ready(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def restart_count(val = nil); end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def started(val = nil); end

    sig { returns(KubeDSL::DSL::V1::ContainerState) }
    def state; end

  end
end
