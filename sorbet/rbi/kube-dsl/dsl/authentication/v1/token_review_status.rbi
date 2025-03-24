# typed: strict

module KubeDSL
  module DSL
    module Authentication
      module V1
        class TokenReviewStatus < ::KubeDSL::DSLObject
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

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
          def audiences(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
          def authenticated(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
          def error(val = nil); end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Authentication::V1::UserInfo).void)).returns(KubeDSL::DSL::Authentication::V1::UserInfo) }
          def user(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def user_present?; end
        end
      end
    end
  end
end