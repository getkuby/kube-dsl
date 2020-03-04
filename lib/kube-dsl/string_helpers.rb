module KubeDSL
  module StringHelpers
    def capitalize(str)
      str.sub(/\A(.)/) { $1.upcase }
    end

    def underscore(str)
      str
        .gsub(/([A-Z\d]+)([A-Z][a-z])/, '\1_\2')
        .gsub(/([a-z\d])([A-Z])/, '\1_\2')
        .gsub('-', '_')
        .downcase
    end
  end

  StringHelpers.extend(StringHelpers)
end
