require "xor_encryptor/version"
require "xor_encryptor/core_extentions"

module XorEncryptor
  class << self
    def encode(string, key)
      #We use m as a modifier for each string sequence
      if key.size < string.size
        mult = (string.size / key.size) + 1
        key =(key * mult)[0..(string.size - 1)]
      end

      string.split("").zip(key.split("")).map{|rc| (rc[0].ord ^ rc[1].ord).to_s.rjust(3, "0") }.join
    end

    def decode(string, key)
      string_array = string.split("").to_a.each_slice(3).map(&:join)

      if key.size < string.size
        mult = (string.size / key.size) + 1
        key =(key * mult)[0..(string.size - 1)]
      end

      string_array.zip(key.split("")).map{|rc| (rc[0].to_i ^ rc[1].ord).chr }.join
    end

    def self_xor_digest(string)
      string.split("").reduce("0"){|c, x| c.to_s.ord ^ x.ord }
    end
  end
end