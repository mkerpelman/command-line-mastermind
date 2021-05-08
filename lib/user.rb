require './lib/playable.rb'

class User

    include Playable

    attr_reader :master_code

    def generate_master_code
        print "Please enter your 4-digit master code with digits between 1 and 6: "
        code = gets.chomp.chars.map! { |string| string.to_i }
        until verify_code_validity(code)
            print "That's not a valid code. Please try again: "
            code = gets.chomp.chars.map! { |string| string.to_i }
        end
        @master_code = code
    end

end