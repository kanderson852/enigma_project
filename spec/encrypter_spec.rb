require './lib/encrypter'
require 'spec_helper'
require 'date'
require "./lib/enigma"

describe Encrypter do

  let(:encrypter) {Encrypter.new}

  it 'exists' do
    expect(encrypter).to be_an_instance_of(Encrypter)
  end

  it 'attributes' do
    expect(encrypter.character_set).to eq(("a".."z").to_a << " ")
  end
end
