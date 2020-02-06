module KubeDSL::DSL::Pkg
  class Info
    extend ::KubeDSL::ValueFields
    value_fields :build_date, :compiler, :git_commit, :git_tree_state, :git_version, :go_version, :major, :minor, :platform

    def serialize
      {}.tap do |result|
        result[:buildDate] = build_date
        result[:compiler] = compiler
        result[:gitCommit] = git_commit
        result[:gitTreeState] = git_tree_state
        result[:gitVersion] = git_version
        result[:goVersion] = go_version
        result[:major] = major
        result[:minor] = minor
        result[:platform] = platform
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
