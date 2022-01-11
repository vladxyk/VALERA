class FileManager
  def initialize
    @save_file = './gamedata/saved_game.json'
    @config_file = './gamedata/actions.json'
  end

  def save(valera)
    hash = {
      'health' => valera.health,
      'alcohol' => valera.alcohol,
      'positive' => valera.positive,
      'tiredness' => valera.tiredness,
      'money' => valera.money
    }

    File.write(@save_file, JSON.pretty_generate(hash))
  end

  def load_game
    return unless File.exist?(@save_file)

    file = File.open(@save_file)
    JSON.parse(file.read)
  end

  def load_config
    file = File.open(@config_file)
    JSON.parse(file.read)
  end
end
