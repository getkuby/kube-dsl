# typed: false

require 'securerandom'

module KubeDSL
  module ValueFields
    class ClassMismatchError < StandardError; end

    module ClassMethods
      def value_fields(*fields)
        fields.each { |field| value_field(field) }
      end

      def value_field(field, default: nil)
        __fields__[:value] << field

        define_method(field) do |value = (value_set = true; nil)|
          if value_set
            instance_variable_set(:"@#{field}", value)
          else
            instance_variable_get(:"@#{field}") || (
              default.respond_to?(:call) ? default.call(self) : default
            )
          end
        end
      end

      def object_field(field, allow_empty: false, &field_block)
        __fields__[:object] << field
        ivar = :"@#{field}"

        define_method(field) do |&block|
          val = instance_variable_get(ivar)

          unless val
            val = field_block.call
            instance_variable_set(ivar, val)
          end

          val.instance_exec(&block) if block
          val
        end

        define_method("#{field}_present?") do
          instance_variable_defined?(ivar)
        end
      end

      def key_value_field(field, format:)
        __fields__[:key_value] << field

        define_method(field) do |&block|
          ivar = :"@#{field}"
          val = instance_variable_get(ivar)

          unless val
            val = ::KubeDSL::KeyValueFields.new(format: format)
            instance_variable_set(ivar, val)
          end

          val.instance_exec(&block) if block
          val
        end
      end

      def array_field(field, accessor = nil, &field_block)
        accessor ||= Inflector.pluralize(field.to_s).to_sym

        __fields__[:array] << { field: field, accessor: accessor }

        define_method(field) do |elem_name = nil, &block|
          ivar = :"@#{accessor}"
          arr = instance_variable_get(ivar)

          # use a hash so elements can be named and modified later
          unless arr
            arr = {}
            instance_variable_set(ivar, arr)
          end

          if elem_name && elem = arr[elem_name]
            elem.instance_eval(&block) if block
            elem
          else
            if field_block
              new_val = field_block.call
              new_val.instance_eval(&block) if block
            else
              new_val = block.call if block
            end

            arr[elem_name || SecureRandom.hex] = new_val
            new_val
          end
        end

        define_method(accessor) do
          ivar = :"@#{accessor}"
          arr = instance_variable_get(ivar)

          unless arr
            arr = {}
            instance_variable_set(ivar, arr)
          end

          arr.values
        end
      end

      def __fields__
        @__fields__ ||= {
          value: [],
          object: [],
          key_value: [],
          array: []
        }
      end
    end


    module InstanceMethods
      def merge!(other, fields: nil)
        unless other.is_a?(self.class)
          raise ClassMismatchError, 'cannot merge two objects of '\
            "different types, namely '#{self.class}' and '#{other.class}'"
        end

        (self.class.__fields__[:value] + self.class.__fields__[:object]).each do |field|
          next if fields && !fields.include?(field)
          ivar = :"@#{field}"

          if other_val = other.instance_variable_get(ivar)
            instance_variable_set(ivar, other_val)
          end
        end

        self.class.__fields__[:key_value].each do |field|
          next if fields && !fields.include?(field)
          send(field).merge!(other.send(field))
        end

        self.class.__fields__[:array].each do |af|
          next if fields && !fields.include?(af[:field])
          ivar = :"@#{af[:accessor]}"

          arrs = instance_variable_get(ivar) || {}

          arrs.merge!(
            other.instance_variable_get(ivar) || {}
          )

          instance_variable_set(ivar, arrs)
        end
      end

      def merge(other, fields)
        self.class.new.tap do |result|
          result.merge!(self)
          result.merge!(other, fields: fields)
        end
      end
    end


    def self.extended(base)
      base.include(InstanceMethods)
      base.extend(ClassMethods)
    end
  end
end
