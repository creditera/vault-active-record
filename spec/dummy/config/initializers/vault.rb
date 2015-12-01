require "vault/active_record"

require_relative "../../../support/vault_server"

Vault::ActiveRecord.configure do |vault|
  vault.application = "dummy"
  vault.address     = RSpec::VaultServer.address
  vault.token       = RSpec::VaultServer.token
  vault.enabled     = true
end
