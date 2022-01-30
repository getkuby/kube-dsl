# typed: true

module KubeDSL::DSL::Flowcontrol::V1alpha1
  class Subject < ::KubeDSL::DSLObject
    object_field(:group) { KubeDSL::DSL::Flowcontrol::V1alpha1::GroupSubject.new }
    value_field :kind
    object_field(:service_account) { KubeDSL::DSL::Flowcontrol::V1alpha1::ServiceAccountSubject.new }
    object_field(:user) { KubeDSL::DSL::Flowcontrol::V1alpha1::UserSubject.new }

    validates :group, object: { kind_of: KubeDSL::DSL::Flowcontrol::V1alpha1::GroupSubject }
    validates :kind, field: { format: :string }, presence: false
    validates :service_account, object: { kind_of: KubeDSL::DSL::Flowcontrol::V1alpha1::ServiceAccountSubject }
    validates :user, object: { kind_of: KubeDSL::DSL::Flowcontrol::V1alpha1::UserSubject }

    def serialize
      {}.tap do |result|
        result[:group] = group.serialize
        result[:kind] = kind
        result[:serviceAccount] = service_account.serialize
        result[:user] = user.serialize
      end
    end

    def kind_sym
      :subject
    end
  end
end
