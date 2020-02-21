module KubeDSL::DSL::Rbac::V1alpha1
  class Subject
    extend ::KubeDSL::ValueFields

    value_fields :api_version, :kind, :name, :namespace

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:apiVersion] = api_version
        result[:kind] = kind
        result[:name] = name
        result[:namespace] = namespace
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :subject
    end
  end
end
