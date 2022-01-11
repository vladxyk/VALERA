require 'rspec'
require_relative '../src/actions'

describe Actions do
  let(:action) { Actions.new }
  let(:valera) { Valera.new({ 'health' => 100, 'alcohol' => 0, 'positive' => 0, 'tiredness' => 0, 'money' => 300 }) }
  let(:config) { FileManager.new.load_config }

  context 'when Valera works' do
    it 'change attributes' do
      action.do_action(config['actions'][0], valera)
      expect(valera.money).to eq 400
      expect(valera.positive).to eq(-5)
    end
  end

  context 'when Valera contemplates nature' do
    it 'change attributes' do
      action.do_action(config['actions'][1], valera)
      expect(valera.tiredness).to eq 10
      expect(valera.positive).to eq 1
    end
  end

  context 'when Valera  drinks and watches TV series' do
    it 'change attributes' do
      action.do_action(config['actions'][2], valera)
      expect(valera.alcohol).to eq 30
      expect(valera.positive).to eq(-1)
      expect(valera.health).to eq 95
    end
  end

  context 'when Valera  went to the bar' do
    it 'change attributes' do
      action.do_action(config['actions'][3], valera)
      expect(valera.alcohol).to eq 60
      expect(valera.positive).to eq 1
      expect(valera.tiredness).to eq 40
      expect(valera.health).to eq 90
    end
  end

  context 'when Valera  drinking with marginal friends' do
    it 'change attributes' do
      action.do_action(config['actions'][4], valera)
      expect(valera.alcohol).to eq 90
      expect(valera.positive).to eq 5
      expect(valera.tiredness).to eq 80
      expect(valera.health).to eq 20
    end
  end

  context 'when Valera Sing in the subways' do
    it 'change attributes' do
      action.do_action(config['actions'][5], valera)
      expect(valera.alcohol).to eq 10
      expect(valera.positive).to eq 1
      expect(valera.tiredness).to eq 20
      expect(valera.money).to eq 310
    end
  end

  it 'change attributes when alcohol [30..60]' do
    valera.alcohol = 40
    action.do_action(config['actions'][5], valera)
    expect(valera.money).to eq 360
  end

  context 'when Valera slept' do
    it 'change attributes' do
      action.do_action(config['actions'][6], valera)
      expect(valera.alcohol).to eq 0
      expect(valera.tiredness).to eq 0
    end

    it 'change happy when alcohol >= 70' do
      valera.alcohol = 80
      valera.positive = 10
      action.do_action(config['actions'][6], valera)
      expect(valera.alcohol).to eq 30
      expect(valera.positive).to eq 7
    end
  end
end
