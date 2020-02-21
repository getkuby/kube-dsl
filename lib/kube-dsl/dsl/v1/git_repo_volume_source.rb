module KubeDSL::DSL::V1
  class GitRepoVolumeSource
    extend ::KubeDSL::ValueFields

    value_fields :directory, :repository, :revision

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:directory] = directory
        result[:repository] = repository
        result[:revision] = revision
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :git_repo_volume_source
    end
  end
end
