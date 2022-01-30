# typed: strict

module KubeDSL::DSL::Meta::V1
  class APIResource < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(String)).returns(String) }
    def categories(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def group(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def kind(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def name(val = nil); end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def namespaced(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def short_names(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def singular_name(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def storage_version_hash(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def verbs(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def version(val = nil); end

  end
end