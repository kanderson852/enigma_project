require 'spec_helper'
require 'date'
require "./lib/enigma"
require './lib/encrypter'
describe Enigma do
  let(:enigma) {Enigma.new}
  it 'exists' do
    expect(enigma).to be_an_instance_of(Enigma)
  end

  it 'can encrypt' do
    expect(enigma.encrypt("hello world", "02715", "040895")).to eq({encryption: "keder ohulw", key: "02715", date: "040895"})
    expect(enigma.encrypt("hello world", "02715")).to be_a(Hash)
    expect(enigma.encrypt("hello world", "02715")).to include(key: "02715")
  end

  it 'can decrypt' do
    expect(enigma.decrypt("keder ohulw", "02715", "040895")).to eq({decryption: "hello world", key: "02715", date: "040895"})
    encrypted = enigma.encrypt("hello world", "02715")
    expect(enigma.decrypt(encrypted[:encryption], "02715")).to be_a(Hash)
    expect(enigma.decrypt(encrypted[:encryption], "02715")).to include(key: "02715", decryption: "hello world")
  end
end
