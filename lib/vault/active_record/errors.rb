module Vault
  module ActiveRecord
    class VaultActiveRecordError < RuntimeError; end

    class UnknownSerializerError < VaultActiveRecordError
      def initialize(key)
        super <<-EOH
  Unknown Vault serializer `:#{key}'. Valid serializers are:

      #{SERIALIZERS.keys.sort.map(&:inspect).join(", ")}

  Please refer to the documentation for more examples.
  EOH
      end
    end

    class ValidationFailedError < VaultActiveRecordError; end
  end
end
