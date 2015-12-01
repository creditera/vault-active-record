require "spec_helper"

describe Vault::EncryptedModel do
  let(:klass) do
    Class.new(ActiveRecord::Base) do
      include Vault::EncryptedModel
    end
  end

  describe ".vault_attribute" do
    it "raises an exception if a serializer and :encode is given" do
      expect {
        klass.vault_attribute(:foo, serializer: :json, encode: ->(r) { r })
      }.to raise_error(Vault::ActiveRecord::ValidationFailedError)
    end

    it "raises an exception if a serializer and :decode is given" do
      expect {
        klass.vault_attribute(:foo, serializer: :json, decode: ->(r) { r })
      }.to raise_error(Vault::ActiveRecord::ValidationFailedError)
    end

    it "defines a getter" do
      klass.vault_attribute(:foo)
      expect(klass.instance_methods).to include(:foo)
    end

    it "defines a setter" do
      klass.vault_attribute(:foo)
      expect(klass.instance_methods).to include(:foo=)
    end

    it "defines a checker" do
      klass.vault_attribute(:foo)
      expect(klass.instance_methods).to include(:foo?)
    end

    it "defines dirty attribute methods" do
      klass.vault_attribute(:foo)
      expect(klass.instance_methods).to include(:foo_change)
      expect(klass.instance_methods).to include(:foo_changed?)
      expect(klass.instance_methods).to include(:foo_was)
    end
  end
end
