class String
  def to_xor_digest
    XorEncryptor.self_xor_digest(self)
  end
end