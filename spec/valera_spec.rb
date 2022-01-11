require_relative './spec_helper'
require_relative '../src/valera'

describe Valera do
  let(:valera) { Valera.new }

  context 'starting characteristics' do
    it { expect(valera.health).to eq 100 }
    it { expect(valera.alcohol).to eq 0 }
    it { expect(valera.positive).to eq 0 }
    it { expect(valera.tiredness).to eq 0 }
    it { expect(valera.money).to eq 0 }
  end

  describe '#health=' do
    context 'range of health attr = [0, 100]' do
      it 'valid value' do
        valera.health = 50
        expect(valera.health).to eq 50
      end
      it 'more than upper bound' do
        valera.health = 110
        expect(valera.health).to eq 100
      end
      it 'less than lower bound' do
        valera.health = -10
        expect(valera.health).to eq 0
      end
    end
  end

  describe '#mana=' do
    context 'range of mana attr = [0, 100]' do
      it 'valid value' do
        valera.alcohol = 50
        expect(valera.alcohol).to eq 50
      end
      it 'more than upper bound' do
        valera.alcohol = 110
        expect(valera.alcohol).to eq 100
      end
      it 'less than lower bound' do
        valera.alcohol = -10
        expect(valera.alcohol).to eq 0
      end
    end
  end

  describe '#positive=' do
    context 'range of positive attr = [-10, 10]' do
      it 'valid value' do
        valera.positive = 5
        expect(valera.positive).to eq 5
      end
      it 'more than upper bound' do
        valera.positive = 20
        expect(valera.positive).to eq 10
      end
      it 'less than lower bound' do
        valera.positive = -20
        expect(valera.positive).to eq(-10)
      end
    end
  end

  describe '#tiredness=' do
    context 'range of tiredness = [0, 100]' do
      it 'valid value' do
        valera.tiredness = 50
        expect(valera.tiredness).to eq 50
      end
      it 'more than upper bound' do
        valera.tiredness = 110
        expect(valera.tiredness).to eq 100
      end
      it 'less than lower bound' do
        valera.tiredness = -10
        expect(valera.tiredness).to eq 0
      end
    end
  end

  describe '#dead?' do
    context 'Valera is dead' do
      it 'HP = 0' do
        valera.health = 0
        expect(valera.dead?).to be true
      end
      it 'positive = -10' do
        valera.positive = -10
        expect(valera.dead?).to be true
      end
      it 'money < 0' do
        valera.money = -100
        expect(valera.dead?).to be true
      end
      it 'tiredness = 100' do
        valera.tiredness = 100
        expect(valera.dead?).to be true
      end
    end

    context 'Valera is not dead' do
      it 'HP = 10' do
        valera.health = 10
        expect(valera.dead?).to be false
      end
      it 'positive = -5' do
        valera.positive = -5
        expect(valera.dead?).to be false
      end
      it 'money = 100' do
        valera.money = 100
        expect(valera.dead?).to be false
      end
      it 'tiredness = 90' do
        valera.tiredness = 90
        expect(valera.dead?).to be false
      end
    end
  end
end
