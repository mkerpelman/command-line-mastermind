require './lib/playable.rb'
require './lib/game.rb'

class Computer

    include Playable

    attr_reader :master_code, :current_guess, :possibilities

    def initialize
        self.create_all_permutations
    end

    def generate_master_code
        code = Array.new(0)
        4.times { code << rand(1..6) }
        @master_code = code
    end

    def make_guess(turn_number, previous_turn_matches)
        @current_guess = guess_algorithm(turn_number, previous_turn_matches)
    end

    private

    def create_all_permutations
        @possibilities = (1..6).to_a.permutation(4).to_a
    end

    def guess_algorithm(turn_number, previous_turn_matches)
        if turn_number == 1
            guess = [1, 1, 2, 2]
        else
            filter_by_matches(@current_guess, previous_turn_matches)
            guess = @possibilities[rand(0..@possibilities.length)]
        end
        @possibilities.delete(guess)
        guess
    end

    def filter_by_matches(real_guess, previous_turn_matches)
        @possibilities.each_with_index do |hypothetical_master, index|
            points = compare_guess_to_master(real_guess, hypothetical_master)
            unless points == previous_turn_matches
                @possibilities.delete_at(index)
            end
        end
    end
end

