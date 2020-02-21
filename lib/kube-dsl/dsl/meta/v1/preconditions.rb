module KubeDSL::DSL::Meta::V1
  class Preconditions
    extend ::KubeDSL::ValueFields

    value_fields :resource_version, :uid

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:resourceVersion] = resource_version
        result[:uid] = uid
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :preconditions
    end
  end
end
