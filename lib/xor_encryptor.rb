require "xor_encryptor/version"
require "xor_encryptor/core_extentions"

module XorEncryptor
  class << self
    def process(string, key)
      #We use m as a modifier for each string sequence
      if key.size < string.size
        mult = (string.size / key.size) + 1
        key =(key * mult)[0..(string.size - 1)]
      end

      string.split("").zip(key.split("")).map{|rc| (rc[0].ord ^ rc[1].ord).chr }.join
    end

    alias :decode :process
    alias :encode :process

    def self_xor_digest(string)
      string.split("").reduce("0"){|c, x| c.to_s.ord ^ x.ord }
    end
  end
end