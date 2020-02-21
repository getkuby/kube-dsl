module KubeDSL::DSL::Flowcontrol::V1alpha1
  class GroupSubject
    extend ::KubeDSL::ValueFields

    value_fields :name

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:name] = name
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :group_subject
    end
  end
end
