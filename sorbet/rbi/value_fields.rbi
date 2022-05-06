# typed: strict

module KubeDSL
  module ValueFields
    class ClassMismatchError < StandardError
    end

    module ClassMethods
      sig { params(fields: T.untyped).returns(T.untyped) }
      def value_fields(*fields); end

      sig { params(field: T.untyped, default: T.untyped).returns(T.untyped) }
      def value_field(field, default: nil); end

      sig { params(field: T.untyped, allow_empty: T.untyped, field_block: T.untyped).returns(T.untyped) }
      def object_field(field, allow_empty: false, &field_block); end

      sig { params(field: T.untyped, format: T.untyped).returns(T.untyped) }
      def key_value_field(field, format:); end

      sig { params(field: T.untyped, accessor: T.untyped, field_block: T.untyped).returns(T.untyped) }
      def array_field(field, accessor = nil, &field_block); end

      sig { returns(T.untyped) }
      def __fields__; end
    end

    module InstanceMethods
      sig { params(other: T.untyped, fields: T.untyped).returns(T.untyped) }
      def merge!(other, fields: nil); end

      sig { params(other: T.untyped, fields: T.untyped).returns(T.untyped) }
      def merge(other, fields); end
    end

    sig { params(base: T.untyped).returns(T.untyped) }
    def self.extended(base); end
  end
end
