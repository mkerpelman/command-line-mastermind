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

end

x = Board.new
x.display