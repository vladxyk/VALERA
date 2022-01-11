require 'simplecov'

SimpleCov.start do
  add_filter '/spec/'
  add_filter '/src/game.rb'
  add_filter '/src/menu.rb'
end
SimpleCov.minimum_coverage 90
