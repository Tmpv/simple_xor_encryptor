require 'spec_helper'

describe "XorEncryptor module" do 
  subject{ XorEncryptor }

  it {should respond_to :encode}
  it {should respond_to :decode}
  it {should respond_to :self_xor_digest}

  it "String should have and to_xor_digest method" do 
    expect(String.new).to respond_to :to_xor_digest
  end

  describe "enecrypt decrupt should work" do 
    it {
      str = SecureRandom.hex(10)
      key = SecureRandom.hex(5)

      encoded = XorEncryptor::encode str, key
      decoded = XorEncryptor::decode encoded, key

      expect(str).to eq decoded
    }
  end


end