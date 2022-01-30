# typed: strict

module KubeDSL::DSL::Apiextensions::V1beta1
  class JSONSchemaProps < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(String)).returns(String) }
    def additional_items(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def additional_properties(val = nil); end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::Apiextensions::V1beta1::JSONSchemaProps))
      ).returns(T::Array[KubeDSL::DSL::Apiextensions::V1beta1::JSONSchemaProps])
    }
    def all_ofs(elem_name = nil, &block); end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::Apiextensions::V1beta1::JSONSchemaProps))
      ).returns(T::Array[KubeDSL::DSL::Apiextensions::V1beta1::JSONSchemaProps])
    }
    def any_ofs(elem_name = nil, &block); end

    sig { params(val: T.nilable(String)).returns(String) }
    def default(val = nil); end

    sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
    def definitions(&block); end

    sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
    def dependencies(&block); end

    sig { params(val: T.nilable(String)).returns(String) }
    def description(val = nil); end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::Apiextensions::V1beta1::JSON))
      ).returns(T::Array[KubeDSL::DSL::Apiextensions::V1beta1::JSON])
    }
    def enums(elem_name = nil, &block); end

    sig { params(val: T.nilable(String)).returns(String) }
    def example(val = nil); end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def exclusive_maximum(val = nil); end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def exclusive_minimum(val = nil); end

    sig { returns(KubeDSL::DSL::Apiextensions::V1beta1::ExternalDocumentation) }
    def external_docs; end

    sig { params(val: T.nilable(String)).returns(String) }
    def format(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def id(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def items(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def max_items(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def max_length(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def max_properties(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def maximum(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def min_items(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def min_length(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def min_properties(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def minimum(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def multiple_of(val = nil); end

    sig { returns(KubeDSL::DSL::Apiextensions::V1beta1::JSONSchemaProps) }
    def not_field; end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def nullable(val = nil); end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::Apiextensions::V1beta1::JSONSchemaProps))
      ).returns(T::Array[KubeDSL::DSL::Apiextensions::V1beta1::JSONSchemaProps])
    }
    def one_ofs(elem_name = nil, &block); end

    sig { params(val: T.nilable(String)).returns(String) }
    def pattern(val = nil); end

    sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
    def pattern_properties(&block); end

    sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
    def properties(&block); end

    sig { params(val: T.nilable(String)).returns(String) }
    def required(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def title(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def type(val = nil); end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def unique_items(val = nil); end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def x_kubernetes_embedded_resource(val = nil); end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def x_kubernetes_int_or_string(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def x_kubernetes_list_map_keys(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def x_kubernetes_list_type(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def x_kubernetes_map_type(val = nil); end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def x_kubernetes_preserve_unknown_fields(val = nil); end

  end
end
