require './lib/computer.rb'
require './lib/player.rb'

class Board

    def initialize
        @current_code_values = Array.new(12) { Array.new(4, " ") }
        @current_matches = Array.new(12) { Array.new(2, " ") }
    end

    def display
        puts <<-HEREDOC

end