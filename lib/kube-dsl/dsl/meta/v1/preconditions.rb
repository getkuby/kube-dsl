module KubeDSL::DSL::Meta::V1
  class Preconditions < ::KubeDSL::DSLObject
    value_fields :resource_version, :uid

    def serialize
      {}.tap do |result|
        result[:resourceVersion] = resource_version
        result[:uid] = uid
      end
    end

    def kind
      :preconditions
    end
  end
end
