# typed: false

module KubeDSL
  class EntrypointBuilder
    include StringHelpers

    attr_reader :builder, :block

    def initialize(builder, &block)
      @builder = builder
      @block = block
    end

    def entrypoint
      ruby_code = "# typed: strict\n\n#{module_namespace}\n"

      builder.each_resource do |resource|
        ns = resource.ref.ruby_namespace.join('::')
        next if block && !block.call(resource, ns)

        method_name = method_name_for(resource)

        ruby_code << "#{indent}def #{method_name}(&block)\n"
        ruby_code << "#{indent}  ::#{ns}::#{resource.ref.kind}.new(&block)\n"
        ruby_code << "#{indent}end\n\n"
      end

      ruby_code.strip!

      (indent_level - 1).downto(0) do |idx|
        ruby_code << "\n#{'  ' * idx}end"
      end

      "#{ruby_code}\n"
    end

    def entrypoint_rbi
      rbi_code = "# typed: strict\n\n#{module_namespace}\n"

      builder.each_resource do |resource|
        ns = resource.ref.ruby_namespace.join('::')
        next if block && !block.call(resource, ns)

        method_name = method_name_for(resource)

        rbi_code << "#{indent}T::Sig::WithoutRuntime.sig { params(block: T.proc.void).returns(::#{ns}::#{resource.ref.kind}) }\n"
        rbi_code << "#{indent}def #{method_name}(&block); end\n\n"
      end

      rbi_code.strip!

      (indent_level - 1).downto(0) do |idx|
        rbi_code << "\n#{'  ' * idx}end"
      end

      "#{rbi_code}\n"
    end

    def path
      @path ||= File.join(builder.output_dir, File.dirname(builder.autoload_prefix), 'entrypoint.rb')
    end

    def rbi_path
      @rbi_path ||= begin
        rbi_path = File.join('sorbet', 'rbi', *path.split(File::SEPARATOR)[1..-1])
        "#{rbi_path.chomp('.rb')}.rbi"
      end
    end

    private

    def kinds
      @kinds ||= builder.each_resource.map do |resource|
        ns = resource.ref.ruby_namespace.join('::')
        next if block && !block.call(resource, ns)

        resource.ref.kind
      end
    end

    def ambiguous_kinds
      @ambiguous_kinds ||= kinds.compact.tally.each_with_object([]) do |(kind, count), memo|
        memo << kind if count > 1
      end
    end

    def module_namespace
      @module_namespace ||= [*builder.entrypoint_namespace, 'Entrypoint'].map.with_index do |ep_mod, idx|
        "#{'  ' * idx}module #{ep_mod}"
      end.join("\n")
    end

    def indent_level
      @indent_level ||= builder.entrypoint_namespace.size + 1
    end

    def indent
      @indent ||= '  ' * indent_level
    end

    def method_name_for(resource)
      if ambiguous_kinds.include?(resource.ref.kind)
        underscore([resource.ref.namespace, resource.ref.version, resource.ref.kind].compact.join('_'))
      else
        underscore(resource.ref.kind)
      end
    end
  end
end
