require './lib/encrypter'
require 'spec_helper'
require 'date'
require "./lib/enigma"

describe Encrypter do

  let(:encrypter) {Encrypter.new}
  let(:date) {'030201'}

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
    expect(encrypter.a_offset(date)).to be_a(Integer)
    expect(encrypter.a_offset(date)).to eq(0)
  end

  it 'b offsets' do
    expect(encrypter.b_offset(date)).to be_a(Integer)
    expect(encrypter.b_offset(date)).to eq(4)
  end

  it 'c offsets' do
    expect(encrypter.c_offset(date)).to be_a(Integer)
    expect(encrypter.c_offset(date)).to eq(0)
  end

  it 'd offsets' do
    expect(encrypter.d_offset(date)).to be_a(Integer)
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
    expect(encrypter.a_key).to eq(01)
  end

  it 'b_key' do
    allow(encrypter).to receive(:key_finder).and_return('01234')
    expect(encrypter.b_key).to eq(12)
  end

  it 'c_key' do
    allow(encrypter).to receive(:key_finder).and_return('01234')
    expect(encrypter.c_key).to eq(23)
  end

  it 'd_key' do
    allow(encrypter).to receive(:key_finder).and_return('01234')
    expect(encrypter.d_key).to eq(34)
  end

  it 'lists the offsets' do
    expect(encrypter.keys).to be_a(Hash)
    allow(encrypter).to receive(:key_finder).and_return('01234')
    expect(encrypter.keys).to eq( {'A' => 01, 'B' => 12, 'C' => 23, 'D' => 34})
  end

  it 'generates total shift' do
    allow(encrypter).to receive(:key_finder).and_return('01234')
    expect(encrypter.shifts(date, encrypter.keys)).to eq({'A' => 01, 'B' => 16, 'C' => 23, 'D' => 35})
  end

  it 'can encrypt' do
    expect(encrypter.encrypt("hello world", "02715", "040895")).to eq({encryption: "keder ohulw", key: "02715", date: "040895"})
  end
end
