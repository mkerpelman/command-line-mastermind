require './lib/playable.rb'

class Computer

    include Playable

    attr_reader :master_code

    def generate_master_code
        code = Array.new(0)
        4.times { code << rand(1..6) }
        @master_code = code
    end

end