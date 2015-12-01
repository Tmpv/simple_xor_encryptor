require "xor_encryptor/version"
require "xor_encryptor/core_extentions"

module XorEncryptor
  class << self
    def encode(string, key)
      key = modify_key string, key
      string.split("").zip(key.split("")).map{|rc| (rc[0].ord ^ rc[1].ord).to_s.rjust(3, "0") }.join
    end

    def decode(string, key)
      string_array = string.split("").to_a.each_slice(3).map(&:join)
      key = modify_key string_array, key
      string_array.zip(key.split("")).map{|rc| (rc[0].to_i ^ rc[1].ord).chr }.join
    end

    def modify_key(obj, key)
      return key if key.size >= obj.size

      mult = (obj.size / key.size) + 1
      (key * mult)[0..(obj.size - 1)]
    end

    def self_xor_digest(string)
      string.split("").reduce("0"){|c, x| c.to_s.ord ^ x.ord }
    end
  end
end