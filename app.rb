require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Booba")
player2 = Player.new("Kaaris")

puts "Octogone sans règles ! :"
puts " "

while player1.life_points > 0 && player2.life_points > 0

    puts "Voici l'état des rappeurs :"
    print player1.show_state
    print player2.show_state
    puts " "
    puts player1.attacks(player2)
    if player2.life_points <= 0

    else
        puts "Mais #{player2.name} réplique !"
        puts player2.attacks(player1)
    end
    
  end

binding.pry
