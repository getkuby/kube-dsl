# typed: strict

module KubeDSL
  module DSL
    module Apiextensions
      module V1
        class JSONSchemaProps < ::KubeDSL::DSLObject
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

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def additional_items(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def additional_properties(val = nil); end

          T::Sig::WithoutRuntime.sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Apiextensions::V1::JSONSchemaProps))
            ).returns(T::Array[KubeDSL::DSL::Apiextensions::V1::JSONSchemaProps])
          }
          def all_ofs(elem_name = nil, &block); end

          T::Sig::WithoutRuntime.sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Apiextensions::V1::JSONSchemaProps))
            ).returns(T::Array[KubeDSL::DSL::Apiextensions::V1::JSONSchemaProps])
          }
          def any_ofs(elem_name = nil, &block); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def default(val = nil); end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
          def definitions(&block); end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
          def dependencies(&block); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def description(val = nil); end

          T::Sig::WithoutRuntime.sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Apiextensions::V1::JSON))
            ).returns(T::Array[KubeDSL::DSL::Apiextensions::V1::JSON])
          }
          def enums(elem_name = nil, &block); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def example(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def exclusive_maximum(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def exclusive_minimum(val = nil); end

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Apiextensions::V1::ExternalDocumentation) }
          def external_docs; end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def external_docs_present?; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def format(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def id(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def items(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
          def max_items(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
          def max_length(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
          def max_properties(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
          def maximum(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
          def min_items(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
          def min_length(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
          def min_properties(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
          def minimum(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
          def multiple_of(val = nil); end

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Apiextensions::V1::JSONSchemaProps) }
          def not_field; end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def not_field_present?; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def nullable(val = nil); end

          T::Sig::WithoutRuntime.sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Apiextensions::V1::JSONSchemaProps))
            ).returns(T::Array[KubeDSL::DSL::Apiextensions::V1::JSONSchemaProps])
          }
          def one_ofs(elem_name = nil, &block); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def pattern(val = nil); end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
          def pattern_properties(&block); end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
          def properties(&block); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def required(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def title(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def type(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def unique_items(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def x_kubernetes_embedded_resource(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def x_kubernetes_int_or_string(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def x_kubernetes_list_map_keys(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def x_kubernetes_list_type(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def x_kubernetes_map_type(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def x_kubernetes_preserve_unknown_fields(val = nil); end

          T::Sig::WithoutRuntime.sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Apiextensions::V1::ValidationRule))
            ).returns(T::Array[KubeDSL::DSL::Apiextensions::V1::ValidationRule])
          }
          def x_kubernetes_validations(elem_name = nil, &block); end
        end
      end
    end
  end
end