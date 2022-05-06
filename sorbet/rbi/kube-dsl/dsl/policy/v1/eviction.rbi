# typed: strict

module KubeDSL
  module DSL
    module Policy
      module V1
        class Eviction < ::KubeDSL::DSLObject
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


          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Meta::V1::DeleteOptions) }
          def delete_options; end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def delete_options_present?; end


          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def metadata_present?; end
        end
      end
    end
  end
end