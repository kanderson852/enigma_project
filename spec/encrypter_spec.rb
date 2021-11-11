require './lib/encrypter'
require 'spec_helper'
require 'date'
require "./lib/enigma"

describe Encrypter do

  let(:encrypter) {Encrypter.new}
  let(:date) {Date.new(2001,2,3)}

  it 'exists' do
    expect(encrypter).to be_an_instance_of(Encrypter)
  end

  it 'attributes' do
    expect(encrypter.character_set).to eq(("a".."z").to_a << " ")
  end

  it 'offsets' do
    expect(encrypter.offset.length).to be(4)
    expect(encrypter.offset(date).length).to be(4)
    expect(encrypter.offset(date)).to eq('0401')
  end

  it 'a offsets' do
    expect(encrypter.a_offset).to be_a(Integer)
    expect(encrypter.a_offset(date)).to eq(0)
  end

  it 'b offsets' do
    expect(encrypter.b_offset).to be_a(Integer)
    expect(encrypter.b_offset(date)).to eq(4)
  end

  it 'c offsets' do
    expect(encrypter.c_offset).to be_a(Integer)
    expect(encrypter.c_offset(date)).to eq(0)
  end

  it 'd offsets' do
    expect(encrypter.d_offset).to be_a(Integer)
    expect(encrypter.d_offset(date)).to eq(1)
  end
end
