module KubeDSL::DSL::Batch::V1
  class JobList
    extend ::KubeDSL::ValueFields

    array_field(:item) { KubeDSL::DSL::Batch::V1::Job.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "batch/v1"
        result[:kind] = "JobList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :job_list
    end
  end
end
