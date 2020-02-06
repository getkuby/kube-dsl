module KubeDSL::DSL
  class Container
    extend ::KubeDSL::ValueFields
    value_fields :image, :image_pull_policy, :name, :stdin, :stdin_once, :termination_message_path, :termination_message_policy, :tty, :working_dir
    array_field :arg
    array_field :command
    array_field(:env) { KubeDSL::DSL::EnvVar.new }
    array_field(:env_from) { KubeDSL::DSL::EnvFromSource.new }
    array_field(:port) { KubeDSL::DSL::ContainerPort.new }
    array_field(:volume_device) { KubeDSL::DSL::VolumeDevice.new }
    array_field(:volume_mount) { KubeDSL::DSL::VolumeMount.new }
    object_field(:lifecycle) { KubeDSL::DSL::Lifecycle.new }
    object_field(:liveness_probe) { KubeDSL::DSL::Probe.new }
    object_field(:readiness_probe) { KubeDSL::DSL::Probe.new }
    object_field(:resources) { KubeDSL::DSL::ResourceRequirements.new }
    object_field(:security_context) { KubeDSL::DSL::SecurityContext.new }
    object_field(:startup_probe) { KubeDSL::DSL::Probe.new }

    def serialize
      {}.tap do |result|
        result[:image] = image
        result[:imagePullPolicy] = image_pull_policy
        result[:name] = name
        result[:stdin] = stdin
        result[:stdinOnce] = stdin_once
        result[:terminationMessagePath] = termination_message_path
        result[:terminationMessagePolicy] = termination_message_policy
        result[:tty] = tty
        result[:workingDir] = working_dir
        result[:args] = args
        result[:command] = commands
        result[:env] = envs.map(&:serialize)
        result[:envFrom] = env_froms.map(&:serialize)
        result[:ports] = ports.map(&:serialize)
        result[:volumeDevices] = volume_devices.map(&:serialize)
        result[:volumeMounts] = volume_mounts.map(&:serialize)
        result[:lifecycle] = lifecycle.serialize
        result[:livenessProbe] = liveness_probe.serialize
        result[:readinessProbe] = readiness_probe.serialize
        result[:resources] = resources.serialize
        result[:securityContext] = security_context.serialize
        result[:startupProbe] = startup_probe.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
