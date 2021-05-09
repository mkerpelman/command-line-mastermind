require './lib/computer.rb'
require './lib/user.rb'

class Board

    TOTAL_TURNS = 12

    def initialize
        @current_code_values = Array.new(12) { Array.new(4, " ") }
        @current_matches = Array.new(12) { Array.new(2, " ") }
    end

    def display
        puts "********************  MASTERMIND  *********************"
        for turn in (1..TOTAL_TURNS)
            if turn < 10
                puts "*TURN 0#{turn}* || #{@current_code_values[turn - 1][0]} | #{@current_code_values[turn - 1][1]} | #{@current_code_values[turn - 1][2]} | #{@current_code_values[turn - 1][3]} || Exact: #{@current_matches[turn - 1][0]} | Approximate: #{@current_matches[turn - 1][1]}"
            else
                puts "*TURN #{turn}* || #{@current_code_values[turn - 1][0]} | #{@current_code_values[turn - 1][1]} | #{@current_code_values[turn - 1][2]} | #{@current_code_values[turn - 1][3]} || Exact: #{@current_matches[turn - 1][0]} | Approximate: #{@current_matches[turn - 1][1]}"
            end
        end
    end

    def update(guess_array, match_array, turn)
        self.write_new_guess(guess_array, turn)
        self.write_new_match(match_array, turn)
    end

    private

    def write_new_guess(array, turn)
        @current_code_values[turn - 1] = array
    end

    def write_new_match(array, turn)
        @current_matches[turn - 1] = array
    end


end