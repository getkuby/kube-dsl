module KubeDSL::DSL::Meta::V1
  class OwnerReference < ::KubeDSL::DSLObject
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

    def kind
      :owner_reference
    end
  end
end
