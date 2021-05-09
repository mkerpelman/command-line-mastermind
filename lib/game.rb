require './lib/computer.rb'
require './lib/user.rb'
require './lib/board.rb'

class Game

    attr_reader :turn_number, :current_guess, :current_match

    def play
        @game_mode = self.select_game_mode
        @turn_number = 1
        self.codebreaker if @game_mode == 1
        self.codemaker if @game_mode == 2
    end

    private

    def select_game_mode
        print "\nEnter '1' for codebreaker mode or '2' for codemaker mode: "
        mode = gets.chomp.to_i
        until (1..2).to_a.include? mode
            print "Not a valid input, try again: "
            mode = gets.chomp.to_i
        end
        mode
    end

    def codebreaker
        self.initialize_classes
        @master_code = @computer.generate_master_code
        while @turn_number <= 12
            if self.win?
                puts "\nYou beat the computer! Good work!"
                break
            else
                @current_guess = @user.make_guess
                @current_matches = @computer.compare_guess_to_master(@current_guess, @master_code)
                @board.update(@current_guess, @current_matches, @turn_number)
                system "clear"
                @board.display
                @turn_number += 1
            end
        end
        unless self.win?
            puts "\nThe computer beat you. You suck!"
        end
    end

    def codemaker
        self.initialize_classes
        @master_code = @user.generate_master_code
        while @turn_number <= 12
            if self.win?
                puts "The computer beat you. You suck!"
                break
            else
                @current_guess = @computer.make_guess(@turn_number)
                @current_matches = @computer.compare_guess_to_master(@current_guess, @master_code)
                @board.update(@current_guess, @current_matches, @turn_number)
                system "clear"
                @board.display
                @turn_number += 1
                sleep(1)
            end
        end
        unless self.win?
            puts "\nYou beat the computer! Good work!"
        end
    end

    def initialize_classes
        @computer = Computer.new
        @user = User.new
        @board = Board.new
    end

    def win?
        if @master_code == @current_guess
            true
        else
            false
        end
    end

end