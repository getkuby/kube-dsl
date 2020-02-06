module KubeDSL::DSL
  class ServiceAccount
    extend ::KubeDSL::ValueFields
    value_fields :automount_service_account_token
    array_field(:image_pull_secret) { KubeDSL::DSL::LocalObjectReference.new }
    array_field(:secret) { KubeDSL::DSL::ObjectReference.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ObjectMeta.new }

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
  end
end
