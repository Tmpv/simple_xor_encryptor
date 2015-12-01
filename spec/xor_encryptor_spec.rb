require 'spec_helper'

describe "XorEncryptor module" do 
  let(:example_string){ SecureRandom.hex(8)}
  subject{ XorEncryptor }

  it {should respond_to :encode}
  it {should respond_to :decode}


end