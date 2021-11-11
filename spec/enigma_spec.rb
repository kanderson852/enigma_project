require 'spec_helper'
require 'date'
require "./lib/enigma"
require './lib/encrypter'
describe Enigma do
  let(:enigma) {Enigma.new}
  it 'exists' do
    expect(enigma).to be_an_instance_of(Enigma)
  end

  xit 'can encrypt' do
    expect(enigma.encrypt(message, key, date)).to be_a(Hash)
  end

  xit 'can decrypt' do
    expect(enigma.decrypt(message, key, date)).to be_a(Hash)
  end

  it 'uses current date as a default' do
    allow(Date).to receive(:today).and_return(Date.new(2001,2,3))
  end

end
