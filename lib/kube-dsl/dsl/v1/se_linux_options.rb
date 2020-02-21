module KubeDSL::DSL::V1
  class SELinuxOptions
    extend ::KubeDSL::ValueFields

    value_fields :level, :role, :type, :user

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:level] = level
        result[:role] = role
        result[:type] = type
        result[:user] = user
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :se_linux_options
    end
  end
end
