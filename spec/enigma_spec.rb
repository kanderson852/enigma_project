require 'date'
require "rspec"
require "./lib/enigma"

describe Enigma do
  let(:enigma) {Enigma.new}
  it 'exists' do
    expect(enigma).to be_an_instance_of(Enigma)
  end

  it 'can encrypt' do
    expect(enigma.encrypt(message, key, date)).to be_a(Hash)
  end

  it 'can decrypt' do
    expect(enigma.decrypt(message, key, date)).to be_a(Hash)
  end
end
