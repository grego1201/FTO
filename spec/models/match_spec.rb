# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Match, type: :model do
  let(:right_fencer) { create(:fencer) }
  let(:left_fencer) { create(:fencer) }
  let(:poule) { create(:poule) }
  let(:create_attrs) do
    {
      right_fencer_id: right_fencer.id,
      left_fencer_id: left_fencer.id,
      poule: poule
    }
  end

  subject { described_class.new(create_attrs) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'should belongs to right_fencer' do
    t = described_class.reflect_on_association(:right_fencer)
    expect(t.macro).to eq(:belongs_to)
  end

  it 'should belongs to left_fencer' do
    t = described_class.reflect_on_association(:left_fencer)
    expect(t.macro).to eq(:belongs_to)
  end
end
