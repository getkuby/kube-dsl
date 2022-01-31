# typed: true

module KubeDSL::DSL::Flowcontrol::V1beta1
  class UserSubject < ::KubeDSL::DSLObject
    value_field :name

    validates :name, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:name] = name
      end
    end

    def kind_sym
      :user_subject
    end
  end
end
