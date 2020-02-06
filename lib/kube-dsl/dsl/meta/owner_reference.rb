module KubeDSL::DSL::Meta
  class OwnerReference
    extend ::KubeDSL::ValueFields
    value_fields :api_version, :block_owner_deletion, :controller, :kind, :name, :uid

    def serialize
      {}.tap do |result|
        result[:apiVersion] = api_version
        result[:blockOwnerDeletion] = block_owner_deletion
        result[:controller] = controller
        result[:kind] = kind
        result[:name] = name
        result[:uid] = uid
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
