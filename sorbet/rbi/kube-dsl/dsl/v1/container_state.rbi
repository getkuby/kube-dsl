# typed: strict

module KubeDSL
  module DSL
    module V1
      class ContainerState < ::KubeDSL::DSLObject
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

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::ContainerStateRunning).void)).returns(KubeDSL::DSL::V1::ContainerStateRunning) }
        def running(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def running_present?; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::ContainerStateTerminated).void)).returns(KubeDSL::DSL::V1::ContainerStateTerminated) }
        def terminated(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def terminated_present?; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::ContainerStateWaiting).void)).returns(KubeDSL::DSL::V1::ContainerStateWaiting) }
        def waiting(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def waiting_present?; end
      end
    end
  end
end