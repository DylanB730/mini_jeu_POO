require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts ""
puts "———————————————————————————————————————————————————"
puts "|    Bienvenue dans Le tounois des champions !    |"
puts "| Le but du jeu est d'être le dernier survivant ! |"
puts "———————————————————————————————————————————————————"
puts ""

puts "Choisi ton nom de Super-héro :"
print "> "
userplayer = gets.chomp
username = HumanPlayer.new(userplayer)
enemies = []
player1 = Player.new("Booba")
player2 = Player.new("Kaaris")
enemies << player1 << player2

while username.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
    puts ""
    puts "Voici l'état de ton joueur"
    puts "---------------------------------------------" 
    puts username.show_state

    puts "Quelle action veux-tu effectuer ?"
    puts "w  Meilleure arme"
    puts "x  Se soigner"
    puts "0  Attaquer player 1"
    puts "1  Attaquer player 2"

    puts " "

    action = gets.chomp

    if action == "w"
      username.search_weapon
      puts gets.chomp
      puts ""
    elsif action == "x"
      username.search_health_pack
      puts gets.chomp
      puts ""
    elsif action == "0"
      username.attacks(player1)
      puts ""
    elsif action == "1"
      username.attacks(player2)
      puts ""
    else
      puts "Erreur de caractère, retentes !"
      print " "
      action = gets.chomp
    end

    puts "Les autres joueurs t'attaquent !"
    puts ""
  
    enemies.each do |player|
      if player.life_points > 0
        player.attacks(username)
      end
    end
    puts gets.chomp

    if username.life_points <= 0
        puts "LOSER ! Game Over !"
    elsif player1.life_points <= 0 && player2.life_points <= 0
        puts "BRAVO ! TU AS GAGNÉ !!"
    end
end
puts ""
puts "Fin du game"

binding.pry