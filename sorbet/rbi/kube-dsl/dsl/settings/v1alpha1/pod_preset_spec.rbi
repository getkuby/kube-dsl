# typed: strict

module KubeDSL::DSL::Settings::V1alpha1
  class PodPresetSpec < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::EnvVar))
      ).returns(T::Array[KubeDSL::DSL::V1::EnvVar])
    }
    def envs(elem_name = nil, &block); end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::EnvFromSource))
      ).returns(T::Array[KubeDSL::DSL::V1::EnvFromSource])
    }
    def env_froms(elem_name = nil, &block); end

    sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
    def selector; end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::VolumeMount))
      ).returns(T::Array[KubeDSL::DSL::V1::VolumeMount])
    }
    def volume_mounts(elem_name = nil, &block); end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::Volume))
      ).returns(T::Array[KubeDSL::DSL::V1::Volume])
    }
    def volumes(elem_name = nil, &block); end

  end
end
