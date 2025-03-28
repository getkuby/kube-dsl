# typed: strict

module KubeDSL
  module DSL
    module Apps
      module V1
        class StatefulSetSpec < ::KubeDSL::DSLObject
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

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(T.nilable(Integer)) }
          def min_ready_seconds(val = nil); end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Apps::V1::StatefulSetPersistentVolumeClaimRetentionPolicy).void)).returns(KubeDSL::DSL::Apps::V1::StatefulSetPersistentVolumeClaimRetentionPolicy) }
          def persistent_volume_claim_retention_policy(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def persistent_volume_claim_retention_policy_present?; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
          def pod_management_policy(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(T.nilable(Integer)) }
          def replicas(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(T.nilable(Integer)) }
          def revision_history_limit(val = nil); end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Meta::V1::LabelSelector).void)).returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
          def selector(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def selector_present?; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
          def service_name(val = nil); end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::PodTemplateSpec).void)).returns(KubeDSL::DSL::V1::PodTemplateSpec) }
          def template(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def template_present?; end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Apps::V1::StatefulSetUpdateStrategy).void)).returns(KubeDSL::DSL::Apps::V1::StatefulSetUpdateStrategy) }
          def update_strategy(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def update_strategy_present?; end

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