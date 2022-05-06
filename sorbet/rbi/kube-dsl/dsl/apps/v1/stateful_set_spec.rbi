# typed: strict

module KubeDSL
  module DSL
    module Apps
      module V1
        class StatefulSetSpec < ::KubeDSL::DSLObject
          T::Sig::WithoutRuntime.sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          T::Sig::WithoutRuntime.sig { returns(Symbol) }
          def kind_sym; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
          def min_ready_seconds(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def pod_management_policy(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
          def replicas(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
          def revision_history_limit(val = nil); end

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
          def selector; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def service_name(val = nil); end

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::PodTemplateSpec) }
          def template; end

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Apps::V1::StatefulSetUpdateStrategy) }
          def update_strategy; end

          T::Sig::WithoutRuntime.sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::PersistentVolumeClaim))
            ).returns(T::Array[KubeDSL::DSL::V1::PersistentVolumeClaim])
          }
          def volume_claim_templates(elem_name = nil, &block); end
        end
      end
    end
  end
end