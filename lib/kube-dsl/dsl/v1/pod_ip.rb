module KubeDSL::DSL::V1
  class PodIP
    extend ::KubeDSL::ValueFields

    value_fields :ip

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:ip] = ip
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :pod_ip
    end
  end
end
