require './lib/playable.rb'

class User

    include Playable

    attr_reader :master_code, :current_guess

    def generate_master_code
        @master_code = generate_code("master code")
    end

    def make_guess
        @current_guess = generate_code("guess")
    end

    private

    def generate_code(code_type)
        print "Please enter your 4-digit #{code_type} with digits between 1 and 6: "
        code = gets.chomp.chars.map! { |string| string.to_i }
        until verify_code_validity(code)
            print "That's not a valid code. Please try again: "
            code = gets.chomp.chars.map! { |string| string.to_i }
        end
        code
    end

end