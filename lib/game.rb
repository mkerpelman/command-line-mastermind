class Game

    def play
        self.print_starting_instructions
        @game_mode = self.select_game_mode
    end

    private

    def print_starting_instructions
    end

    def select_game_mode
        print "Enter '1' to be codebreaker or '2' to be codemaker: "
        mode = gets.chomp.to_i
        until (1..2).to_a.include? mode
            print "Not a valid input, try again: "
            mode = gets.chomp.to_i
        end
        mode
    end

end
