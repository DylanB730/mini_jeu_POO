class Player
    attr_accessor :name, :life_points

    def initialize(name)
        @name = name
        @life_points = 10
    end

    def show_state
            puts "#{name} a #{@life_points} points de vie"
    end

    def gets_damage(damage_HP)
        @life_points = @life_points - damage_HP
        if @life_points <= 0
            puts " "
            puts "#{name} est K.O !"
        else
            puts "#{name} a #{@life_points} points de vie"
        end
    end

    def attacks(target)
        puts "#{@name} cogne #{target.name} !"
        damage = compute_damage
        puts "#{@name} vole #{damage} points à #{target.name}!"
        target.gets_damage(damage)
    end

    def compute_damage
        return rand(1..6)
    end
end

class HumanPlayer < Player
    attr_accessor :weapon_level
    
    def initialize(name)
        @weapon_level = 1
        @life_points = 100
        @name = name 
    end

    def show_state
        puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
    end

    def search_weapon
        new_weapon = rand(1..6)
        puts "tu viens de trouver une arme de niveau #{new_weapon}"

        if new_weapon > @weapon_level
            @weapon_level = new_weapon
            puts "Youhou ! Elle est meilleur que ton arme actuelle : tu la prends."
        else 
            puts "M@*#$..! Elle n'est pas mieux que ton arme actuelle..."
        end
    end

    def search_health_pack
        health_pack = rand(1..6)
        if health_pack == 1
          puts "Tu n'as rien trouvé... "
        elsif health_pack >=2 && health_pack <= 5
          if (( self.life_points + 50) > 100)
            self.life_points = 100
          else
            self.life_points += 50
          end
          puts "Bravo, tu as trouvé un pack de +50 points de vie !"
        else
          if (( self.life_points + 80) > 100)
            self.life_points = 100
          else
            self.life_points += 80
          end
          puts "Waow, tu as trouvé un pack de +80 points de vie !" 
        end
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end
end
