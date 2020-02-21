module KubeDSL::DSL::Flowcontrol::V1alpha1
  class Subject
    extend ::KubeDSL::ValueFields

    value_fields :kind
    object_field(:group) { KubeDSL::DSL::Flowcontrol::V1alpha1::GroupSubject.new }
    object_field(:service_account) { KubeDSL::DSL::Flowcontrol::V1alpha1::ServiceAccountSubject.new }
    object_field(:user) { KubeDSL::DSL::Flowcontrol::V1alpha1::UserSubject.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:kind] = kind
        result[:group] = group.serialize
        result[:serviceAccount] = service_account.serialize
        result[:user] = user.serialize
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
