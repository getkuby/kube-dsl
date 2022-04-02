# typed: strict

module KubeDSL
  module DSL
    module Apiserverinternal
      module V1alpha1
        class ServerStorageVersion < ::KubeDSL::DSLObject
          sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def api_server_id(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def decodable_versions(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def encoding_version(val = nil); end
        end
      end
    end
  end
end