require 'rspec'
require_relative '../src/game'
require_relative '../src/io_adapter'
require_relative '../src/game_states'
require_relative '../src/file_manager'
require_relative '../src/menu'

describe Game do
  include GameStates

  let(:menu) { Menu.new }
  let(:file_manager) { FileManager.new }
  let(:io_adapter) { IoAdapter.new }

  before do
    allow(menu).to receive(:render_game_menu)
    allow(menu).to receive(:print_saved)
    allow(menu).to receive(:print_game_over)

    allow(file_manager).to receive(:save)
    allow(file_manager).to receive(:load_config).and_return(
      Hash.new({ actions: [
                 {
                   name: 'Go to work',
                   conditions: [
                     {
                       name: 'alcohol',
                       min: 0,
                       max: 70
                     },
                     {
                       name: 'tiredness',
                       min: 0,
                       max: 10
                     }
                   ],
                   result: [
                     {
                       name: 'alcohol',
                       value: -30
                     },
                     {
                       name: 'positive',
                       value: -5
                     },
                     {
                       name: 'tiredness',
                       value: 70
                     },
                     {
                       name: 'money',
                       value: 100
                     }
                   ]
                 }
               ] })
    )
  end

  describe 'Game test' do
    it 'Exit works' do
      allow(io_adapter).to receive(:pressed_key).and_return('q')

      game = Game.new(menu, file_manager, io_adapter)
      state, = game.iterate_game(file_manager.load_config, Valera.new, nil)
      expect(state).to eq 2
    end

    it 'save works' do
      allow(io_adapter).to receive(:pressed_key).and_return('s')

      game = Game.new(menu, file_manager, io_adapter)
      state, = game.iterate_game(file_manager.load_config, Valera.new, nil)
      expect(state).to eq 1
    end

    it 'menu works' do
      allow(io_adapter).to receive(:pressed_key).and_return('m')

      game = Game.new(menu, file_manager, io_adapter)
      state, = game.iterate_game(file_manager.load_config, Valera.new, nil)
      expect(state).to eq 0
    end
  end
end
