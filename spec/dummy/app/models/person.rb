module BinarySerializer
  def self.encode(raw)
    return raw if raw.blank?
    raw.unpack("B*")[0]
  end

  def self.decode(raw)
    return raw if raw.blank?
    [raw].pack("B*")
  end
end

class Person < ActiveRecord::Base
  include Vault::EncryptedModel

  vault_attribute :ssn

  vault_attribute :credit_card,
    encrypted_column: :cc_encrypted,
    path: "credit-secrets",
    key: "people_credit_cards"

  vault_attribute :details,
    serialize: :json

  vault_attribute :business_card,
    serialize: BinarySerializer

  vault_attribute :favorite_color,
    encode: ->(raw) { "xxx#{raw}xxx" },
    decode: ->(raw) { raw && raw[3...-3] }

  vault_attribute :non_ascii
end
