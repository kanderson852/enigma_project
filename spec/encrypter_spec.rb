require './lib/encrypter'
require 'spec_helper'
require 'date'
require "./lib/enigma"

describe Encrypter do

  let(:encrypter) {Encrypter.new}
  let(:date) {Date.new(2001,2,3)}
  let(:key) {allow(encrypter).to receive(:key_finder).and_return('01234')}

  it 'exists' do
    expect(encrypter).to be_an_instance_of(Encrypter)
  end

  it 'attributes' do
    expect(encrypter.character_set).to eq(("a".."z").to_a << " ")
  end

  it 'finds offsets' do
    expect(encrypter.offset_finder.length).to be(4)
    expect(encrypter.offset_finder(date).length).to be(4)
    expect(encrypter.offset_finder(date)).to eq('0401')
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

  it 'lists the offsets' do
    expect(encrypter.offset).to be_a(Hash)
    expect(encrypter.offset(date)).to eq( {'A' => 0, 'B' => 4, 'C' => 0, 'D' => 1})
  end

  it 'finds keys' do
    expect(encrypter.key_finder).to be_a(String)
    expect(encrypter.key_finder.length).to eq(5)
    allow(encrypter).to receive(:key_finder).and_return('01234')
    expect(encrypter.key_finder).to eq('01234')
  end

  it 'a_key' do
    allow(encrypter).to receive(:key_finder).and_return('01234')
    expect(encrypter.key_finder).to eq('01')
  end

  it 'b_key' do
    allow(encrypter).to receive(:key_finder).and_return('01234')
    expect(encrypter.key_finder).to eq('12')
  end

  it 'c_key' do
    allow(encrypter).to receive(:key_finder).and_return('01234')
    expect(encrypter.key_finder).to eq('23')
  end

  it 'd_key' do
    allow(encrypter).to receive(:key_finder).and_return('01234')
    expect(encrypter.key_finder).to eq('34')
  end
end
