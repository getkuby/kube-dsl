module KubeDSL::DSL::V1
  class EphemeralContainer < ::KubeDSL::DSLObject
    value_field :args
    value_field :command
    array_field(:env) { KubeDSL::DSL::V1::EnvVar.new }
    array_field(:env_from) { KubeDSL::DSL::V1::EnvFromSource.new }
    value_field :image
    value_field :image_pull_policy
    object_field(:lifecycle) { KubeDSL::DSL::V1::Lifecycle.new }
    object_field(:liveness_probe) { KubeDSL::DSL::V1::Probe.new }
    value_field :name
    array_field(:port) { KubeDSL::DSL::V1::ContainerPort.new }
    object_field(:readiness_probe) { KubeDSL::DSL::V1::Probe.new }
    object_field(:resources) { KubeDSL::DSL::V1::ResourceRequirements.new }
    object_field(:security_context) { KubeDSL::DSL::V1::SecurityContext.new }
    object_field(:startup_probe) { KubeDSL::DSL::V1::Probe.new }
    value_field :stdin
    value_field :stdin_once
    value_field :target_container_name
    value_field :termination_message_path
    value_field :termination_message_policy
    value_field :tty
    array_field(:volume_device) { KubeDSL::DSL::V1::VolumeDevice.new }
    array_field(:volume_mount) { KubeDSL::DSL::V1::VolumeMount.new }
    value_field :working_dir

    validates :args, field: { format: :string }, presence: false
    validates :command, field: { format: :string }, presence: false
    validates :envs, array: { kind_of: KubeDSL::DSL::V1::EnvVar }, presence: false
    validates :env_froms, array: { kind_of: KubeDSL::DSL::V1::EnvFromSource }, presence: false
    validates :image, field: { format: :string }, presence: false
    validates :image_pull_policy, field: { format: :string }, presence: false
    validates :lifecycle, object: { kind_of: KubeDSL::DSL::V1::Lifecycle }
    validates :liveness_probe, object: { kind_of: KubeDSL::DSL::V1::Probe }
    validates :name, field: { format: :string }, presence: false
    validates :ports, array: { kind_of: KubeDSL::DSL::V1::ContainerPort }, presence: false
    validates :readiness_probe, object: { kind_of: KubeDSL::DSL::V1::Probe }
    validates :resources, object: { kind_of: KubeDSL::DSL::V1::ResourceRequirements }
    validates :security_context, object: { kind_of: KubeDSL::DSL::V1::SecurityContext }
    validates :startup_probe, object: { kind_of: KubeDSL::DSL::V1::Probe }
    validates :stdin, field: { format: :boolean }, presence: false
    validates :stdin_once, field: { format: :boolean }, presence: false
    validates :target_container_name, field: { format: :string }, presence: false
    validates :termination_message_path, field: { format: :string }, presence: false
    validates :termination_message_policy, field: { format: :string }, presence: false
    validates :tty, field: { format: :boolean }, presence: false
    validates :volume_devices, array: { kind_of: KubeDSL::DSL::V1::VolumeDevice }, presence: false
    validates :volume_mounts, array: { kind_of: KubeDSL::DSL::V1::VolumeMount }, presence: false
    validates :working_dir, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:args] = args
        result[:command] = command
        result[:env] = envs.map(&:serialize)
        result[:envFrom] = env_froms.map(&:serialize)
        result[:image] = image
        result[:imagePullPolicy] = image_pull_policy
        result[:lifecycle] = lifecycle.serialize
        result[:livenessProbe] = liveness_probe.serialize
        result[:name] = name
        result[:ports] = ports.map(&:serialize)
        result[:readinessProbe] = readiness_probe.serialize
        result[:resources] = resources.serialize
        result[:securityContext] = security_context.serialize
        result[:startupProbe] = startup_probe.serialize
        result[:stdin] = stdin
        result[:stdinOnce] = stdin_once
        result[:targetContainerName] = target_container_name
        result[:terminationMessagePath] = termination_message_path
        result[:terminationMessagePolicy] = termination_message_policy
        result[:tty] = tty
        result[:volumeDevices] = volume_devices.map(&:serialize)
        result[:volumeMounts] = volume_mounts.map(&:serialize)
        result[:workingDir] = working_dir
      end
    end

    def kind_sym
      :ephemeral_container
    end
  end
end
