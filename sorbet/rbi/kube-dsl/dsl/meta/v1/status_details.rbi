# typed: strict

module KubeDSL
  module DSL
    module Meta
      module V1
        class StatusDetails < ::KubeDSL::DSLObject
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

          T::Sig::WithoutRuntime.sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Meta::V1::StatusCause))
            ).returns(T::Array[KubeDSL::DSL::Meta::V1::StatusCause])
          }
          def causes(elem_name = nil, &block); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
          def group(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
          def kind(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
          def name(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(T.nilable(Integer)) }
          def retry_after_seconds(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
          def uid(val = nil); end
        end
      end
    end
  end
end