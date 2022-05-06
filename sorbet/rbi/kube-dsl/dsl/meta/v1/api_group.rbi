# typed: strict

module KubeDSL
  module DSL
    module Meta
      module V1
        class APIGroup < ::KubeDSL::DSLObject
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
          def name(val = nil); end

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Meta::V1::GroupVersionForDiscovery) }
          def preferred_version; end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def preferred_version_present?; end

          T::Sig::WithoutRuntime.sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Meta::V1::ServerAddressByClientCIDR))
            ).returns(T::Array[KubeDSL::DSL::Meta::V1::ServerAddressByClientCIDR])
          }
          def server_address_by_client_cidrs(elem_name = nil, &block); end

          T::Sig::WithoutRuntime.sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Meta::V1::GroupVersionForDiscovery))
            ).returns(T::Array[KubeDSL::DSL::Meta::V1::GroupVersionForDiscovery])
          }
          def versions(elem_name = nil, &block); end
        end
      end
    end
  end
end