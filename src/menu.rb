require_relative './valera'
require 'json'

class Menu
  def initialize(clear_screen = "\e[H\e[2J")
    @file_manager = FileManager.new
    @clear_screen = clear_screen
  end

  def render_game_menu(valera, error)
    puts @clear_screen
    print_statuses(valera)
    print_actions
    print_additional_actions
    print_error(error) if error
  end

  def print_statuses(valera)
    puts 'Valera parameters:'
    puts "[HP]: #{valera.health}"
    puts "[Mana]: #{valera.alcohol}"
    puts "[Positive]: #{valera.positive}"
    puts "[Tiredness]: #{valera.tiredness}"
    puts "[Money]: #{valera.money}$\n\n"
  end

  def print_main_menu
    puts @clear_screen
    puts "Marginal Valera\n\n"
    puts '[1] - Start new Game'
    puts '[2] - Continue Game'
    puts "[3] - Exit\n\n"
    puts 'Choose action: '
  end

  def print_actions
    config = @file_manager.load_config

    action_number = 1
    config['actions'].each do |action|
      puts "#{action_number} - #{action['name']}"
      action_number += 1
    end
  end

  def print_additional_actions
    puts "\ns - Save Game"
    puts 'm - Exit to Menu'
    puts "q - Exit Game\n\n"
    puts 'Choose action: '
  end

  def print_saved
    puts "\nGame Saved!"
    puts 'Press any button:'
  end

  def print_error(error)
    puts error
  end

  def print_game_over
    puts "\nGame Over!"
    puts 'Press any button:'
  end
end
