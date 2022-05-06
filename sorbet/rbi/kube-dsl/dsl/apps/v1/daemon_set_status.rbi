# typed: strict

module KubeDSL
  module DSL
    module Apps
      module V1
        class DaemonSetStatus < ::KubeDSL::DSLObject
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

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
          def collision_count(val = nil); end

          T::Sig::WithoutRuntime.sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Apps::V1::DaemonSetCondition))
            ).returns(T::Array[KubeDSL::DSL::Apps::V1::DaemonSetCondition])
          }
          def conditions(elem_name = nil, &block); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
          def current_number_scheduled(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
          def desired_number_scheduled(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
          def number_available(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
          def number_misscheduled(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
          def number_ready(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
          def number_unavailable(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
          def observed_generation(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
          def updated_number_scheduled(val = nil); end
        end
      end
    end
  end
end