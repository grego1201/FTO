# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Poule, type: :model do
  let(:competition) { create(:competition) }
  let(:create_attrs) do
    {
      number: Faker::Number.number(digits: 2),
      piste: Faker::Number.number(digits: 2),
      competition: competition
    }
  end
  subject { described_class.new(create_attrs) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without number' do
    subject.number = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without piste' do
    subject.piste = nil
    expect(subject).to_not be_valid
  end

  it 'should belongs to one competition' do
    t = described_class.reflect_on_association(:competition)
    expect(t.macro).to eq(:belongs_to)
  end

  it 'should belongs to one referee' do
    t = described_class.reflect_on_association(:referee)
    expect(t.macro).to eq(:belongs_to)
  end
end
