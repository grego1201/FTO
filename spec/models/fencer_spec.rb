# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Fencer, type: :model do
  let(:attributes) do
    {
      first_name: Faker::Lorem.word,
      last_name: Faker::Lorem.word,
      gender: Fencer::GENDERS.first,
      birthday: Faker::Date.birthday,
      country: Faker::Lorem.word
    }
  end

  subject { described_class.new(attributes) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without first name' do
    subject.first_name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid in bad gender' do
    subject.gender = 'foo'
    expect(subject).to_not be_valid
  end

  it 'should have and belongs to many competitions' do
    t = described_class.reflect_on_association(:competitions)
    expect(t.macro).to eq(:has_and_belongs_to_many)
  end
end
