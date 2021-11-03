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
end