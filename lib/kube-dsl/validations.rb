module KubeDSL
  class ValidationError < StandardError; end

  module Validations
    class ValidationErrors
      attr_reader :messages

      def initialize
        @messages = {}
      end

      def add(field_name, msg)
        messages[field_name] ||= []
        messages[field_name] << msg
      end

      def empty?
        messages.empty?
      end
    end

    class PresenceValidator
      attr_reader :field_name, :presence

      def initialize(field_name, presence)
        @field_name = field_name
        @presence = presence
      end

      def validate(obj, errors)
        if presence && obj_empty?(obj)
          errors.add(field_name, 'is required')
        end
      end

      private

      def obj_empty?(obj)
        if obj.respond_to?(:empty)
          obj.empty?
        else
          !!obj
        end
      end
    end

    class ArrayValidator
      attr_reader :field_name, :kind_of

      def initialize(field_name, opts)
        @field_name = field_name
        @kind_of = opts.fetch(:kind_of)
      end

      def validate(obj, errors)
        unless obj.is_a?(Array)
          errors.add(field_name, 'is not an array')
          return
        end

        obj.each_with_index do |elem, idx|
          unless elem.nil? || elem.is_a?(kind_of)
            errors.add(
              field_name, "contains an object at index #{idx} of type '#{elem.class.name}', "\
                "expected '#{kind_of.name}'"
            )
          end
        end
      end
    end

    class FormatValidator
      attr_reader :format

      def initialize(format)
        @format = format
      end

      def valid?(obj)
        klasses.any? { |k| obj.nil? || obj.is_a?(k) }
      end

      def klasses
        @klasses ||= case format
          when :string, :byte
            [String]
          when :integer
            [Integer]
          when :boolean
            [TrueClass, FalseClass]
          else
            raise "format '#{format}' not recognized"
        end
      end
    end

    class FieldValidator
      attr_reader :field_name, :format_validator

      def initialize(field_name, options = {})
        @field_name = field_name
        @format_validator ||= FormatValidator.new(options[:format])
      end

      def validate(obj, errors)
        unless format_validator.valid?(obj)
          errors.add(field_name, "is not a #{format_validator.klasses.map(&:to_s).join(', ')}")
        end
      end
    end

    class ObjectValidator
      attr_reader :field_name, :kind_of

      def initialize(field_name, opts)
        @field_name = field_name
        @kind_of = opts.fetch(:kind_of)
      end

      def validate(obj, errors)
        unless obj.nil? || obj.is_a?(kind_of)
          errors.add(field_name, "'#{obj.class.name}', expected '#{kind_of.name}'")
        end
      end
    end

    class KeyValueValidator
      attr_reader :field_name, :format_validator

      def initialize(field_name, options = {})
        @field_name = field_name
        @format_validator ||= FormatValidator.new(options[:value_format])
      end

      def validate(obj, errors)
        obj.kv_pairs.each_pair do |k, v|
          unless format_validator.valid?(v)
            errors.add(field_name, "expected element '#{k}' to be a #{format_validator.klasses.map(&:to_s).join(', ')}, got #{v.class.name}")
          end
        end
      end
    end

    class InclusionValidator
      attr_reader :field_name, :list

      def initialize(field_name, opts)
        @field_name = field_name
        @list = opts[:in]
      end

      def validate(obj, errors)
        unless list.include?(obj)
          errors.add(field_name, "is not in #{list.join(', ')}")
        end
      end
    end

    module ClassMethods
      def validates(field_name, options)
        validators[field_name] = options.map do |val, *val_args|
          validator_class = case val
            when :array
              ArrayValidator
            when :presence
              PresenceValidator
            when :field
              FieldValidator
            when :object
              ObjectValidator
            when :kv
              KeyValueValidator
            when :inclusion
              InclusionValidator
            else
              raise "couldn't find a(n) #{val} validator"
          end

          validator_class.new(field_name, *val_args)
        end
      end

      def validators
        @validators ||= {}
      end
    end

    module InstanceMethods
      def validate
        errors = ValidationErrors.new

        self.class.validators.each do |field_name, validators|
          field = send(field_name)
          validators.each { |val| val.validate(field, errors) }
        end

        errors
      end

      def validate!
        errors = validate

        unless errors.empty?
          field = errors.messages.keys.first
          message = errors.messages[field].first
          raise ValidationError, "#{field} #{message}"
        end
      end

      def valid?
        errors = validate
        errors.empty?
      end
    end


    def self.extended(base)
      base.include(InstanceMethods)
      base.extend(ClassMethods)
    end
  end
end
