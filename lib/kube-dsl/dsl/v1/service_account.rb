module KubeDSL::DSL::V1
  class ServiceAccount
    extend ::KubeDSL::ValueFields

    value_fields :automount_service_account_token
    array_field(:image_pull_secret) { KubeDSL::DSL::V1::LocalObjectReference.new }
    array_field(:secret) { KubeDSL::DSL::V1::ObjectReference.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "ServiceAccount"
        result[:automountServiceAccountToken] = automount_service_account_token
        result[:imagePullSecrets] = image_pull_secrets.map(&:serialize)
        result[:secrets] = secrets.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :service_account
    end
  end
end
