module KubeDSL::DSL::Authorization::V1beta1
  class ResourceAttributes < ::KubeDSL::DSLObject
    value_field :group
    value_field :name
    value_field :namespace
    value_field :resource
    value_field :subresource
    value_field :verb
    value_field :version

    validates :group, field: { format: :string }, presence: false
    validates :name, field: { format: :string }, presence: false
    validates :namespace, field: { format: :string }, presence: false
    validates :resource, field: { format: :string }, presence: false
    validates :subresource, field: { format: :string }, presence: false
    validates :verb, field: { format: :string }, presence: false
    validates :version, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:group] = group
        result[:name] = name
        result[:namespace] = namespace
        result[:resource] = resource
        result[:subresource] = subresource
        result[:verb] = verb
        result[:version] = version
      end
    end

    def kind_sym
      :resource_attributes
    end
  end
end
