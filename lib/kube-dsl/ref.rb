module KubeDSL
  class Ref
    include StringHelpers

    attr_reader :str, :kind, :namespace, :version

    def initialize(str)
      @str = str

      ns, v, k = str.split('.').last(3)

      if ns == 'api' && v == 'resource'
        @kind = k
      elsif ns == 'core'
        @kind = k
        @version = v
      else
        @kind = k
        @namespace = ns
        @version = v
      end
    end

    def filename
      @filename ||= "#{[kind, namespace, version].compact.map(&:downcase).join('-')}.json"
    end

    def ruby_namespace
      @ruby_namespace ||= begin
        ['KubeDSL'].tap do |mods|
          mods << capitalize(namespace) if namespace
        end
      end
    end

    def ruby_class_path
      @ruby_class_path ||= begin
        path = File.join(
          'lib',
          'kube-dsl'
          *ruby_namespace[1..-1].map { |s| underscore(s) },
          "#{underscore(kind)}.rb"
        )
      end
    end
  end
end
