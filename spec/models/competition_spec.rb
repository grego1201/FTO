# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Competition, type: :model do
  subject { described_class.new(name: 'Name', date: Date.today, gender: 'female') }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without date' do
    subject.date = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without gender' do
    subject.gender = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid in bad gender' do
    subject.gender = 'Other'
    expect(subject).to_not be_valid
  end

  it 'is valid not valid in bad category' do
    subject.category = 'Other category'
    expect(subject).to_not be_valid
  end

  it 'should have and belongs to many fencers' do
    t = described_class.reflect_on_association(:fencers)
    expect(t.macro).to eq(:has_and_belongs_to_many)
  end

  it 'should have and belongs to many referees' do
    t = described_class.reflect_on_association(:referees)
    expect(t.macro).to eq(:has_and_belongs_to_many)
  end

  it 'should have many poules' do
    t = described_class.reflect_on_association(:poules)
    expect(t.macro).to eq(:has_many)
  end
end
