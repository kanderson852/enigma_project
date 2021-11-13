require './lib/encrypter'
require 'spec_helper'
require 'date'
require "./lib/enigma"

describe Encrypter do

  let(:encrypter) {Encrypter.new}
  let(:date) {'030201'}
  let(:key) {'12345'}

  it 'exists' do
    expect(encrypter).to be_an_instance_of(Encrypter)
  end

  it 'attributes' do
    expect(encrypter.character_set).to eq(("a".."z").to_a << " ")
  end

  it 'uses current date as a default' do
    allow(Date).to receive(:today).and_return(Date.new(2001,2,3))
  end

  it 'finds offsets' do
    expect(encrypter.offset_finder.length).to be(4)
    expect(encrypter.offset_finder(date).length).to be(4)
    expect(encrypter.offset_finder(date)).to eq('0401')
  end

  it 'a offsets' do
    expect(encrypter.a_offset(date)).to eq(0)
    allow(Date).to receive(:today).and_return(Date.new(1995,2,3))
    expect(encrypter.a_offset).to eq(7)
  end

  it 'b offsets' do
    expect(encrypter.b_offset(date)).to eq(4)
    allow(Date).to receive(:today).and_return(Date.new(1995,2,3))
    expect(encrypter.b_offset).to eq(0)
  end

  it 'c offsets' do
    expect(encrypter.c_offset(date)).to eq(0)
    allow(Date).to receive(:today).and_return(Date.new(1995,2,3))
    expect(encrypter.c_offset).to eq(2)
  end

  it 'd offsets' do
    expect(encrypter.d_offset(date)).to eq(1)
    allow(Date).to receive(:today).and_return(Date.new(1995,2,3))
    expect(encrypter.d_offset).to eq(5)
  end

  it 'lists the offsets' do
    expect(encrypter.offset(date)).to eq( {'A' => 0, 'B' => 4, 'C' => 0, 'D' => 1})
    allow(Date).to receive(:today).and_return(Date.new(1995,2,3))
    expect(encrypter.offset).to eq({'A' => 7, 'B' => 0, 'C' => 2, 'D' => 5})
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
    expect(encrypter.a_key(key)).to eq(12)
  end

  it 'b_key' do
    allow(encrypter).to receive(:key_finder).and_return('01234')
    expect(encrypter.b_key).to eq(12)
    expect(encrypter.b_key(key)).to eq(23)
  end

  it 'c_key' do
    allow(encrypter).to receive(:key_finder).and_return('01234')
    expect(encrypter.c_key).to eq(23)
    expect(encrypter.c_key(key)).to eq(34)
  end

  it 'd_key' do
    allow(encrypter).to receive(:key_finder).and_return('01234')
    expect(encrypter.d_key).to eq(34)
    expect(encrypter.d_key(key)).to eq(45)
  end

  it 'lists the keys' do
    expect(encrypter.key_hash).to be_a(Hash)
    allow(encrypter).to receive(:key_finder).and_return('01234')
    expect(encrypter.key_hash).to eq( {'A' => 01, 'B' => 12, 'C' => 23, 'D' => 34})
  end

  it 'generates total shift' do
    allow(encrypter).to receive(:key_finder).and_return('01234')
    expect(encrypter.shifts(date)).to eq({'A' => 01, 'B' => 16, 'C' => 23, 'D' => 35})
    expect(encrypter.shifts(date, key)).to eq({'A' => 12, 'B' => 27, 'C' => 34, 'D' => 46})
  end

  it 'can encrypt' do
    expect(encrypter.encrypt("hello world", "02715", "040895")).to eq("keder ohulw")
    expect(encrypter.encrypt("HELLO WORLD", "02715", "040895")).to eq("keder ohulw")
    expect(encrypter.encrypt("@hel?lo world!", "02715", "040895")).to eq("@ked?er ohulw!")
    expect(encrypter.encrypt("hello world", "02715")).to be_a(String)
    expect(encrypter.encrypt("hello world")).to be_a(String)
  end

  it 'can decrypt' do
    expect(encrypter.decrypt("keder ohulw", "02715", "040895")).to eq("hello world")
    expect(encrypter.decrypt("KEDER OHULW", "02715", "040895")).to eq("hello world")
    expect(encrypter.decrypt("keder ohulw!", "02715", "040895")).to eq("hello world!")
  end
end
