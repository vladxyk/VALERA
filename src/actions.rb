require_relative './file_manager'
require 'json'
require 'io/console'

class Actions
  def change_attribute(name, value, valera)
    valera.send("#{name}=", valera.send(name) + value)
  end

  def change_attributes(action, valera)
    action['result'].each do |effect|
      change_attribute(effect['name'], effect['value'], valera)
      next unless effect.include?('condition')

      check_additional_effect(valera, effect)
    end
  end

  def do_action(action, valera)
    unless action['conditions'].size.zero?
      action['conditions'].each do |condition|
        unless valera.send(condition['name']).between?(condition['min'], condition['max'])
          return "\nParameter #{condition['name']} must be less then #{condition['max']}\n"
        end
      end
    end
    change_attributes(action, valera)
    nil
  end

  private

  def check_additional_effect(valera, effect)
    unless valera.send(effect['condition']['name']).between?(effect['condition']['min'], effect['condition']['max'])
      return
    end

    change_attribute(effect['name'], effect['condition']['value'], valera)
  end
end
